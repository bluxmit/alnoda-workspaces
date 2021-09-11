#!/bin/bash

while getopts o:d: flag
do
    case "${flag}" in
        o) output_dir=${OPTARG};;
        d) docs=${OPTARG};;
    esac
done

# Create out folder in /home/static-server
if [ -z "${output_dir}" ]; then output_dir="/home/static-server/python-reports/"; fi
project_name=${PWD##*/}
printf '%s\n' "project name - ${project_name}"
report_dir="${output_dir}/${project_name}/$(date +"%d-%m-%Y-%H-%M-%S")"
mkdir -p "$report_dir"

if [ -z "${pytests_dir}" ]; then pytests_dir="/home/static-server/pytests/"; fi
pytest_dir="${pytests_dir}/${project_name}"

##############################################################################################
#### Linting
##############################################################################################

##### Flake8
flake8 ./ > ${report_dir}/flake8.txt || true


##### Pylint
find . -type f -name "*.py" | xargs pylint | pylint-json2html -f jsonextended -o ${report_dir}/pylint-report.html || true

##############################################################################################
#### Tests
##############################################################################################

##### Pytest HTML reporter
pytest ./test --html-report=${report_dir}/pytest || true
pytest ./tests --html-report=${report_dir}/pytest || true
pytest ./ --html-report=${report_dir}/pytest || true

pytest ./test --html-report=${pytest_dir} || true
pytest ./tests --html-report=${pytest_dir} || true
pytest ./ --html-report=${pytest_dir} || true

##############################################################################################
#### Autoddoc
##############################################################################################

##### Pdoc 
mkdir -p ${report_dir}/pdoc-html
pdoc --html --output-dir ${report_dir}/pdoc-html ./ || true
if ls -1qA  ${report_dir}/pdoc-html | grep -q .
then
    echo "pdoc-html generated!"
else 
    echo "pdoc-html could not be generated!"
    rm -rf  ${report_dir}/pdoc-html
fi

mkdir -p ${report_dir}/pdoc-md
pdoc --output-dir ${report_dir}/pdoc-md ./ || true
if ls -1qA  ${report_dir}/pdoc-md | grep -q .
then
    echo "pdoc-md generated!"
else
    echo "pdoc-md could not be generated!"
    rm -rf  ${report_dir}/pdoc-md
fi

if [ "${docs}" ]; then 
    rm -rf ./docs || ture 
    mkdir -p ./docs
    pdoc --output-dir ./docs ./
fi


##### Portray
portray as_html --output_dir ${report_dir}/portray-site -m ./ || true


##############################################################################################
#### Profiling
##############################################################################################

##### Pyinstrument
mkdir -p ${report_dir}/pyinstrument
ls | grep '.py' | grep -v 'pyc' | grep -v '__' | xargs -I{} pyinstrument -t -r html -o ${report_dir}/pyinstrument/{}.html  {} || true


##### cProfile
mkdir -p ./cProfile
mkdir -p ${report_dir}/cProfile
find . -type f -name "*.py" | xargs -I{} python -m cProfile -o ./cProfile/{}.stats {}       || true
find ./cProfile/ -type f -name "*.stats" | xargs -I{} gprof2dot {} -f pstats -o {}.dot      || true
find ./cProfile/ -type f -name "*.dot" | xargs -I{} dot -Tpng -o {}.png {}                  || true

for file in ./cProfile/*.png; do
    mv ${file} ${report_dir}/cProfile/${file##*/}
done

for file in ./cProfile/*.stats; do
    flameprof $file > ${file}.svg || true
    mv ${file}.svg ${report_dir}/cProfile/${file##*/}.svg
done

rm -rf ./cProfile
#!/bin/bash

while getopts i:o: flag
do
    case "${flag}" in
        i) inventory=${OPTARG};;
        o) output_dir=${OPTARG};;
    esac
done

if [ -z "${output_dir}" ]; then output_dir="/home/static-server/ansible-reports/"; fi
project_name=${PWD##*/}
printf '%s\n' "project name - ${project_name}"
report_dir="${output_dir}/${project_name}/$(date +"%d-%m-%Y-%H-%M-%S")"
mkdir -p "$report_dir"


# Ansible Lint
ansible-lint --nocolor > ${report_dir}/linter.txt


# ansible-cmdb
mkdir -p ./ansible-cmdb
if [ "${inventory}" ]; then 
    ansible -m setup -i ${inventory} --tree ./ansible-cmdb all
else
    ansible -m setup --tree ./ansible-cmdb all
fi
ansible-cmdb ./ansible-cmdb > ${report_dir}/hosts.html
rm -rf ./ansible-cmdb


# Ansible inventory grapher
if [ "${inventory}" ]; then 
    ansible-inventory-grapher -i ${inventory} all | dot -Tpng > ${report_dir}/inventory.png
else
    ansible-inventory-grapher all | dot -Tpng > ${report_dir}/inventory.png
fi


# Ansible playbook grapher
mkdir -p ${report_dir}/plays
if [ "${inventory}" ]; then 
    ls | grep yml | xargs -I{} ansible-playbook-grapher -i ${inventory} --include-role-tasks {} -o ${report_dir}/plays/{}
    ls | grep yaml | xargs -I{} ansible-playbook-grapher -i ${inventory} --include-role-tasks {} -o ${report_dir}/plays/{}
else
    ls | grep yml | xargs -I{} ansible-playbook-grapher --include-role-tasks {} -o ${report_dir}/plays/{}
    ls | grep yaml | xargs -I{} ansible-playbook-grapher --include-role-tasks {} -o ${report_dir}/plays/{}
fi

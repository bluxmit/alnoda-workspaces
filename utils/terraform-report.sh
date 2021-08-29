#!/bin/bash

while getopts i:o: flag
do
    case "${flag}" in
        i) inventory=${OPTARG};;
        o) output_dir=${OPTARG};;
    esac
done

if [ -z "${output_dir}" ]; then output_dir="/home/static-server/terraform-reports/"; fi
project_name=${PWD##*/}
printf '%s\n' "project name - ${project_name}"
report_dir="${output_dir}/${project_name}/$(date +"%d-%m-%Y-%H-%M-%S")"
mkdir -p "$report_dir"

# terraform-docs
terrascan scan > ${report_dir}/terrascan.txt

# Terraform Graph
terraform graph | dot -Tsvg > .${report_dir}/graph.svg

# Terraform Visual
terraform plan -out=${report_dir}/plan.out  
terraform show -json ${report_dir}/plan.out > ${report_dir}/plan.json 
cd ${report_dir} && terraform-visual --plan ${report_dir}/plan.json 

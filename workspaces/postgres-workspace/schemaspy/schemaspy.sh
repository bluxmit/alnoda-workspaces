#!/bin/bash
while getopts h:p:d:u:P:o: flag
do
    case "${flag}" in
        h) host=${OPTARG};;
		p) port=${OPTARG};;
	    d) database=${OPTARG};;
		u) user=${OPTARG};;
		P) password=${OPTARG};;
        o) output_dir=${OPTARG};;
    esac
done

if [ -z "${host}" ]; then host="localhost"; fi 
if [ -z "${port}" ]; then port="5432"; fi 
if [ -z "${output_dir}" ]; then output_dir="/home/static-server/schemaspy"; fi 
 
schemacmd="java -jar /opt/schemaspy/schemaspy.jar -t pgsql -dp /opt/schemaspy/postgresql-42.3.1.jar -host \"${host}\" -port ${port} -db \"${database}\" -u \"${user}\" -o \"${output_dir}\""

if [ "${password}" ]; then 
   schemacmd="${schemacmd} -p ${password}" 

fi 
 
eval $schemacmd
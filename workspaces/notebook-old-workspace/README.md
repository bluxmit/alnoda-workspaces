# Data Workstation


```sh
docker build -t data-workstation-base:3.8 --build-arg docker_registry=rg.fr-par.scw.cloud/dgym .
docker run -p 3000:3000 -p 8001:8000 -p 3012:3012 -p 8092:8092 -p 8448:8448 -p 9992:9992 -p 8085:8085 -p 8086:8086 -p 8082:8082 -p 8084:8084  data-workstation-base:3.8
docker run -p 3000:3000 -p 8001:8000 -p 3012:3012 -p 8092:8092 -p 8448:8448 -p 9992:9992 -p 8085:8085 -p 8086:8086 -p 8082:8082 -p 8084:8084 rg.fr-par.scw.cloud/dgym/python-workstation:3.8
```

## Luigi

Useful links:
- [Luigi Github Repo](https://github.com/spotify/luigi)
- [A Tutorial on Luigi, the Spotify’s Pipeline](https://towardsdatascience.com/a-tutorial-on-luigi-spotifys-pipeline-5c694fb4113e)
- [Create your first ETL in Luigi](http://blog.adnansiddiqi.me/create-your-first-etl-in-luigi/)
- [Luigi on PyPi](https://pypi.org/project/luigi/)


## DBT
Useful links:
- [DBT main page](https://docs.getdbt.com/)
- [dbt(Data Build Tool) Tutorial](https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/)
- [DBT on PyPi](https://pypi.org/project/dbt/)
- [Analytics Engineering with dbt and PostgreSQL](https://dsotm-rsa.space/post/2019/09/01/analytics-engineering-with-dbt-data-build-tool-and-postgres-11/)

```sh
dbt init simple_dbt_project --adapter postgres
```


## Great expectations
Useful links:
- [Great Expectations main page](https://greatexpectations.io/)
- [Great Expectations documentation](https://docs.greatexpectations.io/en/latest/)
- [Great Expectations on PyPi](https://pypi.org/project/great-expectations/)
- [Understanding Great Expectations and How to Use It](https://medium.com/hashmapinc/understanding-great-expectations-and-how-to-use-it-7754c78962f4)
- [Know Your Data Pipelines with Great Expectations](https://medium.com/hashmapinc/know-your-data-pipelines-with-great-expectations-tool-b6d38a2e6f06)

https://www.startdataengineering.com/post/ensuring-data-quality-with-great-expectations/
https://medium.com/hashmapinc/understanding-great-expectations-and-how-to-use-it-7754c78962f4
https://docs.greatexpectations.io/en/stable/guides/tutorials/how_to_create_expectations.html


## Papermill
- [Papermill Report GitHub](https://github.com/ariadnext/papermill_report)
- [Automated Report Generation with Papermill: Part 1](https://pbpython.com/papermil-rclone-report-1.html)
- [Automated Report Generation with Papermill: Part 2]https://pbpython.com/papermil-rclone-report-2.html)








## Prefect
https://docs.prefect.io/core/getting_started/installation.html


## ADVANCED DATA
https://www.datacouncil.ai/blog/25-hot-new-data-tools-and-what-they-dont-do



## PREFECT



RUN pip install prefect==0.14.20

```
[program:prefect]
directory=/home/
command=/bin/sh -c " prefect backend server; prefect server start --ui-port 8095; prefect agent local start "
stderr_logfile = /var/log/prefect-stderr.log
stdout_logfile = /var/log/prefect-stdout.log
logfile_maxbytes = 1024

```
-p 8095:8095
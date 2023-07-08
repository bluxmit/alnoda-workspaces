# Elasticsearch workspace

Alnoda workspace with toolset to interact, manage and administer Opensearch and Elasticsearch cluster.

## Why this images

1. If you need self-hosted tool to interact with Elasticsearch/Opensearch, schedule backups of indexes, 
migrate to other clusters, export and import Elasticsearch data to S3.

2. To directly access Elasticsearch/Opensearch inside your kubernetes cluster.

## Start
 
```
docker run --name elawid-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/elasticsearch-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [elasticdump](https://github.com/elasticsearch-dump/elasticsearch-dump) - awesome tool for moving and saving indices.
- [esbulk](https://github.com/miku/esbulk) - fast parallel command line bulk loading utility for Elasticsearch. 
- [vulcanizer](https://github.com/github/vulcanizer) - cli for interacting with an Elasticsearch cluster.
- [*Codeserver workspace features*](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/codeserver-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## vulcanizer

Check cluster nodes and shards

```
vulcanizer --host es01 nodes
vulcanizer --host es01 shards
```

## elasticdump

Use elasticdump to export index `kibana_sample_data_ecommerce` (from eCommerce sample dataset) to S3 

```
elasticdump \
  --s3AccessKeyId "${access_key_id}" \
  --s3SecretAccessKey "${access_key_secret}" \
  --input=http://es01:9200/kibana_sample_data_ecommerce \
  --output "s3://${bucket_name}/kibana_sample_data_ecommerce.json"
```



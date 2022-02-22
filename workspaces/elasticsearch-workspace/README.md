<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p> 

# Elasticsearch workspace
A tool to manage Elasticsearch/Opensearch clusters. Schedule backups of Elasticsearch indexes, 
migrate to other clusters, export and import Elasticsearch data to S3.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/wid-collage.png" alt="Collage">
</p>

Workspace has IDE to quickly develop scripts, visual scheduler to run those scripts periodically and monitor succesful/failed jobs, 
Filebrowser to upload/download data files directly inside the workspace, browser-based terminal. All the workspace tools are 
browser-based, which makes it suitable for running workspace in kubernetes.

```
docker run --name elawid-1 -d -p 8020-8035:8020-8035 alnoda/elasticsearch-workspace
```

open your browser on [http://localhost:8020](http://localhost:8020)

## What's includes
- [elasticdump](https://github.com/elasticsearch-dump/elasticsearch-dump) - awesome tool for moving and saving indices.
- [esbulk](https://github.com/miku/esbulk) - fast parallel command line bulk loading utility for Elasticsearch. 
- [vulcanizer](https://github.com/github/vulcanizer) - cli for interacting with an Elasticsearch cluster.

in addition - [the common workspace-in-docker toolset](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/workspace-in-docker). 

## Get started

Create `docker-compose.yaml` file to launch locally 3-node Elasticsearch cluster with Kibana 
```yaml
version: '2.2'
services:
  es01:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.16.3
    container_name: es01
    environment:
      - node.name=es01
      - cluster.name=es-docker-cluster
      - discovery.seed_hosts=es02,es03
      - cluster.initial_master_nodes=es01,es02,es03
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    volumes:
      - data01:/usr/share/elasticsearch/data
    ports:
      - 9200:9200
    networks:
      - elastic

  es02:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.16.3
    container_name: es02
    environment:
      - node.name=es02
      - cluster.name=es-docker-cluster
      - discovery.seed_hosts=es01,es03
      - cluster.initial_master_nodes=es01,es02,es03
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    volumes:
      - data02:/usr/share/elasticsearch/data
    networks:
      - elastic

  es03:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.16.3
    container_name: es03
    environment:
      - node.name=es03
      - cluster.name=es-docker-cluster
      - discovery.seed_hosts=es01,es02
      - cluster.initial_master_nodes=es01,es02,es03
      - bootstrap.memory_lock=true
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    volumes:
      - data03:/usr/share/elasticsearch/data
    networks:
      - elastic

  kib01:
    image: docker.elastic.co/kibana/kibana:7.16.3
    container_name: kib01
    ports:
      - 5601:5601
    environment:
      ELASTICSEARCH_URL: http://es01:9200
      ELASTICSEARCH_HOSTS: '["http://es01:9200","http://es02:9200","http://es03:9200"]'
    networks:
      - elastic
  
  workspace:
    image: alnoda/elasticsearch-workspace
    container_name: workspace
    ports:
      - 8020-8030:8020-8030
    networks:
      - elastic

volumes:
  data01:
    driver: local
  data02:
    driver: local
  data03:
    driver: local

networks:
  elastic:
    driver: bridge
```
and start it with `docker-compose up`   

Wait untill the cluster is fully ready, open Kibana on [http://localhost:5601](/http://localhost:5601/) and import 
all sample datasets.  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/elasticsearch-workspace/img/Kibana-sample.png" alt="Kibana" width="750">
</p>

Open workspace UI [http://localhost:8020/](http://localhost:8020/) for quick access to all the workspace tools 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/workspace-in-docker/img/wid-demo.gif" alt="WID demo" width="900">
</p>

Open browser-based terminal [http://localhost:8026/](http://localhost:8026/), check cluster nodes and shards

```
vulcanizer --host es01 nodes
vulcanizer --host es01 shards
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/elasticsearch-workspace/img/vulcanizer-demo.png" alt="vulcanizer" width="750">
</p>

Use elasticdump to export index `kibana_sample_data_ecommerce` (from eCommerce sample dataset) to S3 
```
elasticdump \
  --s3AccessKeyId "${access_key_id}" \
  --s3SecretAccessKey "${access_key_secret}" \
  --input=http://es01:9200/kibana_sample_data_ecommerce \
  --output "s3://${bucket_name}/kibana_sample_data_ecommerce.json"
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/elasticsearch-workspace/img/elasticdump-demo.png" alt="elasticdump" width="750">
</p>

Open browser-based IDE [http://localhost:8026/](http://localhost:8026/) and create file `/home/project/export.sh` file with the script to export data to S3. 
Make it executable with `chmod +x /home/project/export.sh`. 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/elasticsearch-workspace/img/IDE-demo.png" alt="IDE" width="750">
</p>

Open browser-based Scheduler [http://localhost:8026/](http://localhost:8026/) (user/pass: admin/admin), 
and schedule script, for example weekly. Select category - "general", plugin - "Shell Script"

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/elasticsearch-workspace/img/Cronicle-demo.png" alt="Cronicle" width="750">
</p>







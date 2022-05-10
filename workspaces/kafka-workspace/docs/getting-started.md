# Getting started

## Intro

This tutorial demonstrates how to use Kafka workspace to explore and interact with Kafka.  

Singl-node Kafka cluster is running within the workspace, but all the tools can be used with the external Kafka clusters.  

To start, open workspace UI [http://localhost:8020/](http://localhost:8020/) for quick access to all the tools

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/kafka-workspace/img/Kafka-wid.png" alt="Kafka WID" width="750">
</p> 

Open browser-based VS-code editor from the workspace UI, or go directly to [http://localhost:8025/](http://localhost:8025/), and connect 
to the local Kafka cluster using VS-code Kafka extension. You only need to provide the name for the cluster, which can be any.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/kafka-workspace/img/theia-connect-kafka.png" alt="Theia connect WID" width="750">
</p> 

Using VS-code Kafka extension create topic "quickstart-events", and cosume events from this topic directly in VS-code using Kafka extension 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/kafka-workspace/img/theia-kafka-consume.png" alt="Theia Kafka consume" width="750">
</p> 

### Kafka native tools

Kafka distribution itself contains command line tools that allow to create topics, send and consume events, etc. 
Open workspace terminal [http://localhost:8026/](http://localhost:8026/) and go to Kafka directory

```
cd /opt/kafka
```

- create topic

```
bin/kafka-topics.sh --create --partitions 1 --replication-factor 1 --topic quickstart-events --bootstrap-server localhost:9092
```

- send some messages

```
bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
```

- consume messages

```
bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/kafka-workspace/img/send-msg.png" alt="Send message" width="500">
</p> 


### [kt](https://github.com/fgeller/kt)

Kafka tool that likes JSON. 

Configure brokers, topic, Kafka version and authentication via environment variables KT_BROKERS, KT_TOPIC, KT_KAFKA_VERSION and KT_AUTH.  

- Set topic to "quickstart-events" (local Kafka instance by default) 

```
export KT_TOPIC="quickstart-events"
```

- Get information about topics, brockers and consumer groups

```
kt topic 
kt group
```

- consume messages

```
kt consume 
```

- produce messages

```
echo 'Bob wins Oscar' | kt produce -topic quickstart-events -literal
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/kafka-workspace/img/kt-demo.png" alt="KT demo" width="350">
</p> 

### [kafkactl](https://github.com/deviceinsight/kafkactl)

A command-line interface for interaction with Apache Kafka.

- Consume from topic "quickstart-events"

```
kafkactl consume  quickstart-events --from-beginning
kafkactl consume quickstart-events --from-beginning --print-keys --print-timestamps -o yaml
```

### [kcat](https://github.com/edenhill/kcat)

Generic non-JVM producer and consumer for Apache Kafka.

- Consume topic "quickstart-events"

```
kafkacat -b localhost -t quickstart-events
```

- Produce events to the topic 

```
echo "Hello World" | kafkacat -b localhost -t quickstart-events
```


### [kcli](https://github.com/cswank/kcli)

Kafka read only command line browser

Launch kcli in the Workspace terminal

```
kcli
```

### [trubka](https://github.com/xitonix/trubka)

Kafka CLI tool built in Go which gives you everything you need.

- Consume from the topic "quickstart-events"

```
trubka consume plain quickstart-events --brokers localhost:9092
```

- Produce message to the topic

```
trubka produce plain quickstart-events "Random Data" --brokers localhost:9092
```

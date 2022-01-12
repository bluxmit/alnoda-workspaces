# Kafka workspace

Docker image with Kafka, and many other tools that make development with Kafka much more convenient.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/kafka-workspace/img/kafka-wid-collage.png" alt="Collage">
</p>

```
docker run --name rwid-1 -d -p 8020-8035:8020-8035 alnoda/kafka-workspace
```

open your browser on [http://localhost:8020](http://localhost:8020)

### Why

Get started with Kafka very easy. Motivation explained in [this Medium article](https://medium.com/@bluxmit/the-better-development-experience-with-kafka-54f15705a8ee)

__Tools included__
- [kcat](https://github.com/edenhill/kcat)
- [kafkactl](https://github.com/deviceinsight/kafkactl)
- [trubka](https://github.com/xitonix/trubka)
- [kt](https://github.com/fgeller/kt)
- [kcli](https://github.com/cswank/kcli)
- [**and all the workspace-in-docker toolset**](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/workspace-in-docker)

Workspace includes multiple CLI tools for Kafka with their own unique features. 

### Quickstart

Open workspace UI [http://localhost:8020/](http://localhost:8020/) for quick access to all the tools

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

### [kt](https://github.com/fgeller/kt)
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
- Consume from topic "quickstart-events"
```
kafkactl consume  quickstart-events --from-beginning
kafkactl consume quickstart-events --from-beginning --print-keys --print-timestamps -o yaml
```

### [kcat](https://github.com/edenhill/kcat)
- Consume topic "quickstart-events"
```
kafkacat -b localhost -t quickstart-events
```
- Produce events to the topic 
```
echo "Hello World" | kafkacat -b localhost -t quickstart-events
```

### [kcli](https://github.com/cswank/kcli)
Launch kcli in the Workspace terminal
```
kcli
```

### [trubka](https://github.com/xitonix/trubka)
- Consume from the topic "quickstart-events"
```
trubka consume plain quickstart-events --brokers localhost:9092
```
- Produce message to the topic
```
trubka produce plain quickstart-events "Random Data" --brokers localhost:9092
```

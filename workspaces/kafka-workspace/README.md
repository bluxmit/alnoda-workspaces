# Kafka workspace

Portable containerized workspace to interact with Kafka clusters.

## Start
 
```
docker run --name rwid-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/kafka-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

**Kafka CLI tools**

- [Apache Kafka](https://kafka.apache.org/) - single-node cluster for experimentation
- [kcat](https://github.com/edenhill/kcat) - generic non-JVM producer and consumer for Apache Kafka.
- [kafkactl](https://github.com/deviceinsight/kafkactl) - command-line interface for interaction with Apache Kafka.
- [trubka](https://github.com/xitonix/trubka) - Kafka CLI tool built in Go which gives you everything you need.
- [kt](https://github.com/fgeller/kt) - Kafka tool that likes JSON.
- [kcli](https://github.com/cswank/kcli) - Kafka read only command line browser.
- [*Codeserver workspace features*](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/codeserver-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

### Kafka tools

Kafka distribution itself contains command line tools that allow to create topics, send and consume events, etc. 
Open workspace terminal [http://localhost:8026/](http://localhost:8026/) and go to Kafka directory

```
cd /home/abc/kafka
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

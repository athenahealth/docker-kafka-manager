# kafka manager Dockerfile
[kafka manager](https://github.com/yahoo/kafka-manager) is a tool from Yahoo Inc. for managing [Apache Kafka](http://kafka.apache.org).

## Howto
### Quick Start
```
docker run -it --rm  -p 9000:9000 -e ZK_HOSTS="your-zk.domain:2181" -e APPLICATION_SECRET=letmein quay.io/athenahealth/kafka-manager
```
(if you don't define ZK_HOSTS, default value has been set to "localhost:2181")


### Use your own configuration file
```
docker run [...] -v /path/to/confdir:/opt -e KM_CONFIG=/opt/my_shiny.conf quay.io/athenahealth/kafka-manager
```

### Pass arguments to kafka-manager
```
docker run -it --rm  -p 9000:9000 -e ZK_HOSTS="your-zk.domain:2181" -e APPLICATION_SECRET=letmein -e KM_ARGS=-Djava.net.preferIPv4Stack=true quay.io/athenahealth/kafka-manager 
```

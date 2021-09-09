![example workflow](https://github.com/dalmatialab/storm/actions/workflows/main.yml/badge.svg)

# Supported tags and respective Dockerfile links

 - [2.2.0-rc-1](https://github.com/dalmatialab/storm/blob/93b2f042737f84334faad7697bad681d03f7ba2b/Dockerfile)
 - [2.2.0-rc-2](https://github.com/dalmatialab/storm/blob/7b0c02380c6556b97b3119fc295ccdf455264a02/Dockerfile)

# What is Storm ? 

[Apache Storm](https://storm.apache.org/) is a free and open source distributed realtime computation system. Apache Storm makes it easy to reliably process unbounded streams of data, doing for realtime processing what Hadoop did for batch processing. Apache Storm is simple, can be used with any programming language, and is a lot of fun to use!. Apache Storm has many use cases: realtime analytics, online machine learning, continuous computation, distributed RPC, ETL, and more. Apache Storm is fast: a benchmark clocked it at over a million tuples processed per second per node. It is scalable, fault-tolerant, guarantees your data will be processed, and is easy to set up and operate. Apache Storm integrates with the queueing and database technologies you already use. An Apache Storm topology consumes streams of data and processes those streams in arbitrarily complex ways, repartitioning the streams between each stage of the computation however needed. Read more in the tutorial.

<img src="https://github.com/dalmatialab/storm/blob/b304f8dfee1c2bd649e12440686029f20e366217/logo.png?raw=true" width="250" height="150">

# How to use this image

## Start nimbus instance

	$ docker run -d --name some-storm-nimbus -e TYPE="storm nimbus" -e ZOOKEEPER_SERVICE=zookeeper image:tag

Where:

 - `some-storm-nimbus` is name you want to assign to your container
 - `zookeeper` is Zookeeper endpoint at which nimbus is connecting
 - `image` is Docker image name
 - `tag` is Docker image version

## Start supervisor instance

	$ docker run -d --name some-storm-supervisor -e TYPE="storm supervisor" -e NIMBUS_SERVICE=nimbus -e ZOOKEEPER_SERVICE=zookeeper image:tag

Where:

 - `some-storm-supervisor` is name you want to assign to your container
 - `nimbus` is Storm nimbus endpoint at which supervisor is connecting
 - `zookeeper` is Zookeeper endpoint at which nimbus is connecting
 - `image` is Docker image name
 - `tag` is Docker image version

## Start ui instance

	$ docker run -d --name some-storm-ui -e TYPE="storm ui" -e NIMBUS_SERVICE=nimbus -e ZOOKEEPER_SERVICE=zookeeper -p 8080:8080 image:tag

Where:

 - `some-storm-ui` is name you want to assign to your container
 - `nimbus` is Storm nimbus endpoint at which supervisor is connecting
 - `zookeeper` is Zookeeper endpoint at which nimbus is connecting
 - `image` is Docker image name
 - `tag` is Docker image version

## Environment variables

**TYPE**

This is *required* variable. It specifies starting script target. Possible values are: `storm ui`, `storm nimbus`, `storm supervisor`.

**ZOOKEEPER_SERVICE**

This is *required* variable. It specifies Zookeeper endpoint at which Storm supervisor, nimbus and ui will connect.

**NIMBUS_SERVICE**

This is *required* variable. It specifies Storm nimbus endpoint at which supervisor and ui will connect.

**TZ**

This is *optional* variable. It specifes timezone. Default value is `Europe/Zagreb`.

## Ports

Storm UI exposes user interface at port 8080.

## NOTE

This image comes with installed `ssh server` for possible usage with [Streamparse](https://streamparse.readthedocs.io/en/stable/). **Username and password** to connect over ssh is **admin**.

# License


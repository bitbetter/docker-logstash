# Elasticsearch on docker

## Features

* Installs logstash 1.4.2
* Uses supervisord to monitor the logstash process

## Build

```sh
$ docker build -t bitbetter/logstash .
```

## Run

```sh
$ docker run --rm -it bitbetter/logstash
```

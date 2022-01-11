# grc-dashboard
A simple dashboard for [appootb/grc](https://github.com/appootb/grc)

<p>
    <a href="https://hub.docker.com/r/appootb/grc-dashboard">
        <img alt="Docker Cloud Build Status" src="https://img.shields.io/docker/cloud/build/appootb/grc-dashboard?label=docker%20image&logo=docker&style=flat-square">
    </a>
    <a href="https://github.com/appootb/grc-dashboard/actions?workflow=build">
        <img alt="Build Status" src="https://img.shields.io/github/workflow/status/appootb/grc-dashboard/build?label=build&logo=github&style=flat-square">
    </a>
    <img alt="GitHub" src="https://img.shields.io/github/license/appootb/grc-dashboard?style=flat-square">
</p>

## Install

* Update config file `config.yaml`

* Run dashboard

`docker run -d -p 8000:80 -v $PWD/config.yaml:/etc/config.yaml appootb/grc-dashboard`

* [Optional] run dashboard and etcd with docker-compose

> docker-compose.yml

```yaml
version: '3'
services:
  etcd:
    image: quay.io/coreos/etcd:v3.3.25
    environment:
      - ETCDCTL_API=3
    command:
      - "/usr/local/bin/etcd"
      - "--name"
      - "s1"
      - "--data-dir"
      - "/etcd-data"
      - "--listen-client-urls"
      - "http://0.0.0.0:2379"
      - "--advertise-client-urls"
      - "http://0.0.0.0:2379"
      - "--listen-peer-urls"
      - "http://0.0.0.0:2380"
      - "--initial-advertise-peer-urls"
      - "http://0.0.0.0:2380"
      - "--initial-cluster"
      - "s1=http://0.0.0.0:2380"
      - "--initial-cluster-token"
      - "tkn"
      - "--initial-cluster-state"
      - "new"
    ports:
      - "2379:2379"

  dashboard:
    image: appootb/grc-dashboard
    ports:
      - "8000:80"
    volumes:
      - "./config.yaml:/etc/config.yaml"
```

* Browser [http://localhost:8000](http://localhost:8000)

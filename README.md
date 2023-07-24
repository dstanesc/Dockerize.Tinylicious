# Dockerize Tinylicious

Create a docker image for FluidFramework's lightweight relay - Tinylicious.

## Build, Push

> Note: For usage build is technically not required. The `0.7.3` image is already built and pushed to [Docker Hub](https://hub.docker.com/r/dstanesc2/tinylicious).

```sh
docker build -t dstanesc2/tinylicious .
docker tag dstanesc2/tinylicious:latest dstanesc2/tinylicious:0.7.3
docker push dstanesc2/tinylicious:0.7.3
```

## Run with docker

```sh
docker run -d -p 7070:7070 -v $(pwd)/data:/var/tmp dstanesc2/tinylicious:0.7.3
```

## Run with docker-compose

```sh
docker-compose up
docker-compose down
docker-compose kill
```

## Other

```sh
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker exec -it cid /bin/bash
docker diff cid
```

## Behavior

When persistence is enabled (default for the provided docker image), a `git` and a `leveldb` database will store serialized summaries and confirmed operations.

```sh
data/
├── db
│   ├── 000003.log
│   ├── CURRENT
│   ├── LOCK
│   ├── LOG
│   └── MANIFEST-000002
└── tinylicious
    └── local
        └── .git
            ├── objects
            │   ├── 06
            │   │   └── 37a088a01e8ddab3bf3fa98dbe804cbde1a0dc
            │   ├── 18
            │   │   └── e379e0f65d78570a2444605b44ae83083c1fed
            │   ├── 1a
            │   │   └── 64355327b560771178659a4d4c0e0c58d7002f
            │   └── f8
            │       └── 6f375d322540a7802b849ae43d736ea86d0758
            └── refs
                └── heads
                    └── 7fcc9081-2af1-430f-82fb-a4a069dc895d

```

In-flight (to be ordered) operations are stored in memory, hence they are lost when the `tinylicious` process is abruptly terminated (ie. `kill -9`, `docker-compose kill`, etc.). However graceful termination (ie. `kill -15`, `docker-compose down`, etc.) will allow the process to flush the in-memory operations.

`docker-compose down`

![compose down](./img/compose-down.gif)

`docker-compose kill`

![compose kill](./img/compose-kill.gif)


## Licenses

Licensed under either [Apache 2.0](http://opensource.org/licenses/MIT) or [MIT](http://opensource.org/licenses/MIT) at your option.

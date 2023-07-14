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

## Licenses

Licensed under either [Apache 2.0](http://opensource.org/licenses/MIT) or [MIT](http://opensource.org/licenses/MIT) at your option.

# nodebuild-docker

Docker image for building, testing and running node based projects.

## Usage

Build:

```sh
docker build -t nodebuild-docker .
```

Run with local script directory volume mounted:

```sh
docker run -it --name nodebuild-docker \
    -v $(pwd)/scripts:/opt/app/scripts \
    nodebuild-docker
```
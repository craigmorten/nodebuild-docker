# nodebuild-docker

Docker image for building, testing and running node based projects.

## Usage

Build:

```sh
docker build -t nodebuild-docker .
```

Run with local script directory volume mounted, and execute the command of swapping node version to argon:

```sh
cmd="source /usr/local/nvm/nvm.sh; nvm install lts/argon"

docker run -it --rm --name nodebuild-docker \
    -v $(pwd)/scripts:/opt/app/scripts \
    nodebuild-docker /bin/bash -c "${cmd}"
```
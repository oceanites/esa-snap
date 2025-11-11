# ESA SNAP 13 docker images

Docker images of ESA Sentinel Application Platform (SNAP) from http://step.esa.int/main/toolboxes/snap/
This is a fork of the code from [mundalis](https://github.com/mundialis/esa-snap).

## Installation

Build the Ubuntu based image (all SNAP toolboxes). This downloads the installer and builds the docker file `esa-snap12:latest`:

```
bash build.sh
```

## Tutorial

We recommend the following tutorial:

http://step.esa.int/docs/tutorials/SNAP_CommandLine_Tutorial.pdf

### Usage examples

### SNAP Graph Processing Tool - command line
Using the SNAP Graph Processing Tool (GPT):

```
# show help of gpt tool
docker run -it --rm esa-snap12:latest /usr/local/snap/bin/gpt -h
```

One can pass the required processing settings in an XML-encoded graph file which is passing this
graph as parameter to the gpt tool:

```
docker run -it --rm esa-snap12:latest /usr/local/snap/bin/gpt <GraphFile.xml> [options] [<source-file-1> <source-file-2> ...]
```

For further `gpt` usage please refer to the official documentation.

## Background info

This docker image is based on Ubuntu linux and contains all toolboxes. Furthermore,

* the original installer provided by ESA ships its own oracle java.


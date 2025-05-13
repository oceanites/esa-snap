# ESA SNAP 12 docker images

Docker images of ESA Sentinel Application Platform (SNAP) from http://step.esa.int/main/toolboxes/snap/

## Installation

Pull the Ubuntu based image (all SNAP toolboxes):

```
bash build.sh
```

## Tutorial

We recommend the following tutorial:

http://step.esa.int/docs/tutorials/SNAP_CommandLine_Tutorial.pdf

### Usage examples

#### SNAP Graphical User Interface - GUI

Using the GUI, among other functionality the GraphBuilder is available.

Start of GUI, with volume mapping of current directory (`pwd`; may be set to a
different directory) to `/data/` within docker:

```
docker run -it --rm --volume="$(pwd)/:/data" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env DISPLAY=$DISPLAY --device="/dev/dri/card0:/dev/dri/card0" \
    mundialis/esa-snap:latest \
    /usr/local/snap/bin/snap
```

### SNAP Graph Processing Tool - command line
Using the SNAP Graph Processing Tool (GPT):

```
# show help of gpt tool
docker run -it --rm mundialis/esa-snap:latest /usr/local/snap/bin/gpt -h
```

One can pass the required processing settings in an XML-encoded graph file which is passing this
graph as parameter to the gpt tool:

```
docker run -it --rm mundialis/esa-snap:latest /usr/local/snap/bin/gpt <GraphFile.xml> [options] [<source-file-1> <source-file-2> ...]
```

For further `gpt` usage please refer to the official documentation.

## Background info

This docker image is based on Alpine Linux and **only contains the s1tbx toolbox**. Furthermore,

* the original installer provided by ESA ships its own oracle java


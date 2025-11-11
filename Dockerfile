FROM ubuntu:24.04
ARG SNAP_VERSION="13.0.0"

# not sure, if needed
ENV DEBIAN_FRONTEND=noninteractive
USER root

# Install dependencies and tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    build-essential \
    libgfortran5 \
    locales \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    git \
    vim \
    wget \
    zip \
    && apt-get autoremove -y \
    && apt-get clean -y

# Set the locale
ENV LANG=en_US.utf8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.utf8
RUN locale-gen en_US.UTF-8

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
# don't copy 1GB installer file into container, just mount it.
RUN --mount=type=bind,source=esa-snap_all_linux-${SNAP_VERSION}.sh,target=/tmp/esa-snap_all_linux-${SNAP_VERSION}.sh \
    --mount=type=bind,source=response.varfile,target=/tmp/response.varfile \
    sh /tmp/esa-snap_all_linux-${SNAP_VERSION}.sh -q -varfile /tmp/response.varfile
RUN /usr/local/snap/bin/snap --nosplash --nogui --modules --update-all
RUN update-alternatives --remove python /usr/bin/python3

RUN echo "export PATH=\$PATH:/usr/local/snap/bin/" >> /root/.bashrc

# Reduce the image size
RUN apt-get autoremove -y
RUN apt-get clean -y
RUN rm -rf /src

ENTRYPOINT ["/bin/bash"]

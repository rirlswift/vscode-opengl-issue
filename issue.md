# Issue: Allow use of NVidia OpenGL within VsCode Development Container

## Description
We would like to use the Docker NVidia (OpenGL) runtime with VsCode DevContainers.
When starting a simple OpenGL container, VsCode remote reports 'unrecgonized argument --gpus all'. This flag is required by the Docker runtime.

:loudspeaker: The work-around recommended by [Issue 345](https://github.com/microsoft/vscode-remote-release/issues/345) has no effect.

## Context
``` bash
# About VsCode
Version: 1.42.1
Commit: c47d83b293181d9be64f27ff093689e8e7aed054
Date: 2020-02-11T14:50:36.977Z
Electron: 6.1.6
Chrome: 76.0.3809.146
Node.js: 12.4.0
V8: 7.6.303.31-electron.0
OS: Linux x64 5.3.0-26-generic

# About Docker
docker --version
Docker version 19.03.02, build 6a30dfc

# About NVidia Toolkit
sudo nvidia-container-cli --load-kmods info
NVRM version: 435.21
CUDA version: 10.1

Device Index: 0
Device Minor: 0
Model: Quadro P3200
Brand: Quadro
GPU UUID: [masked for security purposes]
Bus Location: 00000000:01:00.0
Architecture: 6.1
```

## Replication 
1) Open THIS issue's folder (uses included container json) in VsCode (starts container)
3) VsCode reports the following error and is unable to start the container.


:loudspeaker: The container json is referencing the publically accessible docker image on [Docker Hub](). 


## Expected results 
1) Build with Dockerfile
```
docker build -t rirlswift/vscode-remote-nvidia-issue:latest .
```
2) Allow xhost access
``` bash
xhost +
```
4) Start the container as follows
``` bash 
  docker run --it --rm \
  -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
  rirlswift/vscode-remote-nvidia-issue \ 
  /bin/bash 
```
3) Run the simple OpenGL program
``` bash
  glxgears
```
4) Program runs in container successfully.

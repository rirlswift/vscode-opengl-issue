FROM nvidia/opengl:base-ubuntu18.04

# Update apt repositories and install Required 3D rendering libraries
RUN apt update && apt install libxext6 libxrender1 libxtst6 libxi6 libxxf86vm1 mesa-utils -y
Tutorial: https://www.youtube.com/watch?v=FkrpUaGThTQ

step 1 : install docker/ qemu / container gcc-cross-x86_64-elf

ressources:
- https://www.qemu.org/download/#linux
- https://www.youtube.com/watch?v=pg19Z8LL06w
- https://hub.docker.com/r/randomdude/gcc-cross-x86_64-elf (DOcker pull command)

step 2 : make the Dockerfile and execute in a terminal the following command : 
sudo docker build buildenv -t myos-buildenv

step 3 : execute in a terminal the following command : 
    for linux OS : 
        docker run --rm -it -v ${PWD}:/root/env myos-buildenv
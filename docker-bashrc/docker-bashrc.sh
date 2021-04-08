#!/bin/bash

# Get container id of exiting container
dgrep(){
    docker ps -a | grep "$1" | cut -c1-12 | head -n 1 
}

# bash into running container
dbash(){
    docker exec -ti "$1" /bin/bash
}

# get all containers
dclsa(){
    docker container ls -a --format "table {{.ID}}\t{{.Status}}\t{{.Names}}"
}

# get all runing containers
dcls(){
    docker container ls --format "table {{.ID}}\t{{.Names}}"
}

# bash into an existing container
debash() {
    docker exec -ti $(dgrep "$1") /bin/bash
}

# sh into an existing container
dsh() {
    docker exec -ti $(dgrep "$1") /bin/sh
}

# Execute something in an existing container
dex() {
    docker exec -ti $(dgrep "$1") $2
}

# Start an existing container
dstart(){
    docker start $(dgrep "$1")
}

# Stop an existing container
dstop(){
    docker stop $(dgrep "$1")
}

# Remove an existing container
drm(){
    docker rm $(dgrep "$1")
}

# Stop and remove an existing container
dsrm(){
    dstop $(dgrep "$1") && drm $(dgrep "$1")
}

# Remove an existing image
dirm(){
    docker image remove $(dgrep "$1")
}

# Get logs of an existing container
dlog(){
    docker logs $(dgrep "$1")
}

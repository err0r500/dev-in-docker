#!/bin/bash

# get the directory of this script not to be dependant upon where it's invoked from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -d "$DIR/home/.emacs.d" ] && {{ .spacemacs }} ; then
    echo "== FIRST RUN ONLY =="
    # clone the develop branch directly
    git clone -b develop https://github.com/syl20bnr/spacemacs $DIR/home/.emacs.d

    {{ .runMeFirst_content }}
fi

f id -nG "$USER" | grep -qw "docker"; then
    systemctl start docker
    USER_NAME=${USER} USER_ID=${UID} docker-compose up -d --build
elif id -nG "$USER" | grep -qw "wheel"; then
    sudo systemctl start docker
    sudo USER_NAME=${USER} USER_ID=${UID} docker-compose up -d --build
else
    echo "not in docker nor wheel group... can't start docker-compose"
fi

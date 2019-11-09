#!/bin/bash

export USER_NAME="$(whoami)"
export USER_ID="$(id -u)"
export GID="$(id -g)"

# get the directory of this script not to be dependant upon where it's invoked from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -d "$DIR/home/.emacs.d" ]; then
    echo "== FIRST RUN =="
    # clone the develop branch directly
    git clone -b develop https://github.com/syl20bnr/spacemacs $DIR/home/.emacs.d

    {{ .runMeFirst_content }}
fi

docker-compose up --build

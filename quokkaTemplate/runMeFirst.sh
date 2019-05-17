#!/bin/bash

# get the directory of this script not to be dependant upon where it's invoked from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install spacemacs
git clone https://github.com/syl20bnr/spacemacs $DIR/home/.emacs.d

{{ .runMeFirst_content }}

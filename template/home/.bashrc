if [ ! -d "./.emacs.d/elpa/" ]; then
    # get the last elpa keys...
    mkdir -p ~/.emacs.d/elpa/gnupg
    gpg --homedir ~/.emacs.d/elpa/gnupg --receive-keys 066DAFCB81E42C40
fi

{{.dotbashrc_content}}

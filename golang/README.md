# Golang

## How-to
### Initial setup
- Copy the `tmplFldr` folder wherever you want to store your project
- Copy the Dockerfile you want in it (not mandatory, just in case you want to tweak it differently according to your different projects)
- build the Dockerfile. ex : `sudo docker build . -f ./golang-1.12.4.Dockerfile -t go-dev`
- In the current folder, clone your project in a folder. ex : `git clone git://github.com/err0r500/go-realworl-clean src` (or simply create a new folder)
- edit the `./start.sh` file : replace the mountpoint of your project according to its expected gopath : here it's `/go/src/github.com/go-realworld-clean`

### Start the container
- start with `./start.sh`

Folder templates contain : 
- `home/` : will be mounted as current user's home. It's purpose is to persist your emacs conf and installed packages   it will mount the home folder as the home of the user in the container, 
- `dep/` : to persist packages installed using dep
- `src/` : where your project's code lies.

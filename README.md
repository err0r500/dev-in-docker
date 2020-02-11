# Dev in Docker

Try a new language without installing anything language-specific on your computer.

The goal of these templates is to provide you the best first experience in a new language while letting the ability to be tweaked as you want (ie. you can safely use it as a starting point for a real project ).

It provides :
- a sandboxed environment (docker)
- an IDE-like experience (spacemacs)
- persistence of the files (docker volume)
- evolve as you want : this script simply bootstraps everything you'll need at first but you're then free to tweak everything !

## Prerequisites
- Docker & docker-compose
- [Quokka](https://github.com/Depado/quokka/releases) must be installed (it's a simple binary that you should put in your PATH)

## How-to

### First time ever

```
git clone git@github.com:err0r500/dev-in-docker.git
cd ./dev-in-docker
```

### First time (per project)

```
qk ./template <destination_folder> -i ./languages/<language_you_want>
cd <destination_folder>
chmod +x ./start.sh
./start.sh
```

NB : the docker daemon must be running, the `start.sh` script just launches a docker-compose

#### Example with Idris

If you don't know [Idris](https://www.idris-lang.org/), let's give it a try !

```
qk ./template ~/my-idris-experiment -i ./languages/idris
cd ~/my-idris-experiment
chmod +x ./start.sh
./start.sh
```

Play with your new language
```
docker exec -it <CONTAINER_ID> bash
emacs
```

### Checklist if something goes wrong : 
Each of the following commands should return no error :

- `docker ps` ie. your docker service is running
- `docker pull fedora:31` ie. you're able to pull an image from docker hub.
- `qk version` should be at least 1.3.1 if you're on windows

You must also be able to mount your project's directory (you'll see when running the start command)


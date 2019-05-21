# Dev in Docker

Try a new language without installing anything language-specific on your computer.

The goal of these templates is to provide you the best first experience in a new language while letting the ability to be tweaked as you want (ie. you can safely use it as a starting point for a reeal project ).

It provides :
- a sandboxed environment (docker)
- an IDE-like experience (spacemacs)
- persistence of the files (docker volume)
- evolve as you want : this script simply bootstraps everything you'll need at first but you're then free to tweak everything !

## Prerequisites
- Docker & docker-compose
- your host's user should be in the docker group in order to be able to run the docker-compose command (otherwise, your files inside the container will be owned by root)
- [Quokka](https://github.com/Depado/quokka/releases) must be installed (it's a simple binary that you should put in your PATH)

### Checklist : 
Each of the following commands should return no error :

- `docker ps` ie. your docker service is running
- `docker pull fedora:30` ie. you're able to pull an image from docker hub.
- `qk version` should be at least 1.3.1 if you're on windows

You must also be able to mount your project's directory (you'll see when running the start command)

## How-to

### First time ever

```
git clone git@github.com:err0r500/dev-in-docker.git
cd ./dev-in-docker
```

### First time (per project)

Let's bootstrap your new project, using Idris as an example (you don't know [Idris](https://www.idris-lang.org/) ? Let's give it a try ! ) 
```
qk ./template ~/my-idris-experiment -i ./languages/idris
cd ~/my-idris-experiment
chmod +x ./start.sh
```
### Rest of the time


Start the docker container
```
./start.sh
```

Play with your new language (in another shell)
```
docker exec -it <CONTAINER_ID> bash
emacs
```

### Just for testing the Idris example

NB : the spacemacs keybindings are notated between <>

- `<Spc-b-s>` (you enter the **B**uffer called **S**cratch
- `MyFunc : Bool -> Int`
- `<Spc-f-s>` (you want this **F**ile to be **S**aved)
- `foo.idr`
- `<Ctrl-c Ctrl-l>` (you **L**oad the file with Idris, you should see a cool animation and the syntactic coloration)

Congratulations ! Next step : [the idris tutorial](http://docs.idris-lang.org/en/latest/tutorial/index.html#tutorial-index))

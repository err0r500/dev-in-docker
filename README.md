# Dev in Docker

Try a new language without installing anything (language-specific) on your computer.
The goal of these templates is to provide the best first experience in a new language so it provides :
- a sandboxed environment (docker)
- an IDE-like experience (spacemacs)
- persistence of the files (docker volume)
- evolve as you want : once the template is created and you launched emacs once, you can modify the Dockerfile and everything else.

## Prerequisites
- Docker & docker-compose
- your host's user should be in the docker group in order to be able to run the docker-compose command (otherwise, your files inside the container will be owned by root)
- [Quokka](https://github.com/Depado/quokka) must be installed (it's a simple binary)

## How-to

### First time only 

Create your project, using Idris as an example (you don't know Idris ? Let's give it a try ! ) 
```
git clone git@github.com:err0r500/dev-in-docker.git
cd ./dev-in-docker
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
docker exec -it app bash
emacs
```

### Just for the Idris example

NB : the spacemacs keybindings are notated between <>

- `<Spc-b-s>` (you enter the **B**uffer called **S**cratch
- `MyFunc : Bool -> Int`
- `<Spc-f-s>` (you want this **F**ile to be **S**aved)
- `foo.idr`
- `<Ctrl-c Ctrl-l>` (you **L**oad the file with Idris, you should see a cool animation and the syntactic coloration)

Congratulations ! Next step : [the idris tutorial](http://docs.idris-lang.org/en/latest/tutorial/index.html#tutorial-index))

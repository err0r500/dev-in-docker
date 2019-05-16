# Dev in Docker

Run spacemacs-based complete dev environments in Docker so you don't have to install anything on your host's system in order to run and develop in a specific language.

- [Dev in Docker](#dev-in-docker)
    - [Prerequisites](#prerequisites)
    - [Principle](#principle)
    - [Final file structure](#final-file-structure)
    - [General How-to](#general-how-to)
    - [Language-specific how-to](#language-specific-how-to)

## Prerequisites
- Docker & docker-compose
- your host's user should be in the docker group in order to be able to run the docker-compose command (otherwise, your files inside the container will be owned by root)
- [Quokka](https://github.com/Depado/quokka) must be installed (it's a simple binary)

## Principle
- Create a folder that will be mounted as your user's home in a docker container

## Final file structure
Here's a general file structure, some languages need additional setup

```
your-project-root
│   Dockerfile
│   docker-compose.yml
│
└───home
│   │   .spacemacs
│   │___.ssh/
│   │   │   yourHostKeys (read-only)
│   │
│   └───src
│       │   yourSourceCodeFiles
│       │   ...
```

## General How-to

NB : this process will be much simplified with [Quokka](https://github.com/Depado/quokka) !


On the host system :

- create the main folder for your projet
- copy inside the Dockerfile & the docker-compose.yml files (so you can edit them afterwards in order to fit your project's specific needs) 
- create the home folder inside your newly-created folder
- copy inside base-spacemacs as .spacemacs

Example :
```
mkdir -p ~/myCoolProject/home
cp devInDockerPath/Dockerfile ~/myCoolProject/
cp devInDockerPath/docker-compose.yml ~/myCoolProject/
cp devInDockerPath/base-spacemacs ~/myCoolProject/home
```
- If you're working on an already existing project, clone anywhere in the home directory

- mv to your project folder
- run `UID=${UID} GID=${GID} docker-compose up --build`
- (in another terminal) attach to the docker container

```
docker ps
docker exec -it <yourDockerContainerID> bash
```

You can now launch emacs. Spacemacs dependencies should download on first launch. If you've got the vanilla emacs instead, a `.emacs.d` folder may be in your home, remove it and relaunch emacs

## Language-specific how-to
Use Quokka

## TODO
add a make file for the docker-compose

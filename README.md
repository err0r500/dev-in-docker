# Dev in Docker

Run spacemacs-based dev environments in Docker so you don't have to install anything on your system in order to run and develop in a specific language.


## Dependencies
Nothing mandatory (except Docker)

- I use [x11docker](https://github.com/mviereck/x11docker) as startup script in order to remove the boilerplate while having security best pratices. If you want to use the "Personal workflow" below, be user to have it in your host's PATH.

- Emacs is installed by default on images. I use spacemacs but it's just a personnal choice.


## Currently available languages list
- golang
- idris

soon :
- haskell
- typescript
- elm

# Personal workflow

## Initial setup for a new language

Build the docker corresponding image. Ex :

`sudo docker build . -f ./idris-1.3.1.Dockerfile -t idris-1.3.1`

## Bootstrap a new project
Copy the `fldrTmpl` wherever you want your project to be. Ex :

```
cp ./fldrTmpl ~/projects/myNewIdrisProject
```

```
mv ~/projects/myNewIdrisProject
```

Create, or clone an existing repo to the `./src` folder

```
git clone git@github.com:err0r500/my-idris-project.git ./src
```

(Optionnal) Install spacemacs in your container's home

```
git clone https://github.com/syl20bnr/spacemacs ./home/.emacs.d
```

## Start your dev environnment

NB : Golang needs you to edit the `start.sh` script in order to mount the src folder at the right place in your GOPATH

```
./start.sh
```

- the content of the `./home` folder will be mounted as the `~` of your user
- the content of the `src` folder will be mounted as the `/src` folder (except in golang)



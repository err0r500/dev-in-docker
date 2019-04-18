# NB : you must currently use the system ghc install (of alpine). 
# To force stack to do so, please run `echo "system-ghc: true" >> ~/.stack/config.yaml` once stack is initialized for your project

FROM alpine:edge as base
RUN apk update && apk upgrade && apk add ca-certificates && rm -rf /var/cache/apk/*
RUN apk add bash wget curl git 

FROM base as language-specific
RUN apk add gcc g++ ghc
RUN adduser --disabled-password docker-dev
RUN wget -qO- https://get.haskellstack.org/ | sh
FROM node:11.14.0-alpine as base
RUN apk add --update git emacs
RUN adduser -D docker-dev

FROM base
USER docker-dev
ENV NPM_CONFIG_PREFIX=/home/docker-dev/.npm-global
RUN mkdir ~/.emacs.d
RUN touch ~/.spacemacs
WORKDIR /home/docker-dev
CMD sleep 9999999999999
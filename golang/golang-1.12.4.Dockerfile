FROM golang:1.12.4-alpine3.9
RUN apk update && apk upgrade && apk add ca-certificates && rm -rf /var/cache/apk/*
RUN apk add bash wget curl git
ARG USER 
RUN echo ${USER}
RUN adduser --disabled-password $USER
USER $USER 
RUN go get -u -v github.com/mdempsky/gocode
RUN go get -u -v github.com/rogpeppe/godef
RUN go get -u -v golang.org/x/tools/cmd/guru
RUN go get -u -v golang.org/x/tools/cmd/gorename
RUN go get -u -v golang.org/x/tools/cmd/goimports
RUN go get -u -v github.com/zmb3/gogetdoc
RUN go get -u -v github.com/cweill/gotests/...
RUN go get -u github.com/haya14busa/gopkgs/cmd/gopkgs
RUN go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
RUN go get -u github.com/josharian/impl

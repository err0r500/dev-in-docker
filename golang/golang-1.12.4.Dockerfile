FROM golang:1.12.4-alpine3.9

# general utilities
RUN apk update && apk upgrade && apk add ca-certificates && rm -rf /var/cache/apk/*
RUN apk add bash wget curl git

# go specific
RUN go get -u github.com/mdempsky/gocode \
	&& go get -u github.com/rogpeppe/godef \
	&& go get -u golang.org/x/tools/cmd/guru \
	&& go get -u golang.org/x/tools/cmd/gorename \
	&& go get -u golang.org/x/tools/cmd/goimports \
	&& go get -u github.com/zmb3/gogetdoc \
	&& go get -u github.com/cweill/gotests/... \
	&& go get -u github.com/haya14busa/gopkgs/cmd/gopkgs \
	&& go get -u github.com/davidrjenni/reftools/cmd/fillstruct \
	&& go get -u github.com/josharian/impl

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# emacs
RUN apk add emacs-x11
ENV NNG_URL="https://github.com/google/fonts/raw/master/ofl/nanumgothic/NanumGothic-Regular.ttf" \
    SCP_URL="https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.tar.gz"
RUN apk --no-cache add font-noto\
    fontconfig \
    && mkdir -p /usr/share/fonts \
    && wget -qO- "${SCP_URL}" | tar xz -C /usr/share/fonts \
    && wget -q "${NNG_URL}" -P /usr/share/fonts \
    && fc-cache -fv


ENTRYPOINT ["emacs"]

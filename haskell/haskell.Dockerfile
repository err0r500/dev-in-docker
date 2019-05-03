FROM alpine:3.9
RUN apk update && apk upgrade && apk add ca-certificates && rm -rf /var/cache/apk/*
RUN apk add bash wget curl git 

RUN apk add gcc g++ ghc
RUN apk add ncurses5 && apk add ncurses5-libs
RUN wget -qO- https://get.haskellstack.org/ | sh

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


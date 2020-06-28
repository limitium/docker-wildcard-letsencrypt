FROM certbot/certbot

LABEL maintainer="limititum@gmail.com"

RUN apk -U upgrade \
    && apk add curl bash \
    iptables \
    ca-certificates \
    e2fsprogs \
    docker \
    && pip install --upgrade pip \
    && pip install certbot-regru \
    && rm -rf /var/cache/apk/*

COPY ./gen-ssl.sh /gen-ssl.sh

ENTRYPOINT [ "/gen-ssl.sh" ]
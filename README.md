Docker Wildcard Certbot for Reg.ru
=================

Get Let's Encrypt wildcard SSL certificates validated by DNS challenges.

**NOTE**

This project currently only support Reg.ru DNS challenges. You have to add your IP to whitelist. And tweek check timeout, in my case it took 3h for updating TXT records.

Usage
-----------

    docker pull limitium/wildcard-letsencrypt-regru

    docker run -it --rm \
        -v "$DIR/ssl:/etc/letsencrypt" \
        -e CERTBOT_EMAIL=duye@example.com \
        -e DOMAIN_NAME=example.com \
        -e REGRU_EMAIL=duye@example.com \
        -e REGRU_PASS=<password> \
        -e CHECK_TIMEOUT=1000 \
        limitium/wildcard-letsencrypt-regru

Example

    docker run -it --rm \
        -v "$DIR/ssl:/etc/letsencrypt" \
        -e CERTBOT_EMAIL=duye@example.com \
        -e DOMAIN_NAME=<Your Domain Name> \
        -e REGRU_EMAIL=<Your regru email> \
        -e REGRU_PASS=<Your regru password> \
        -e SLACK_WEBHOOK=https://hooks.slack.com/services/XXXXXX/XXXXXX/XXXXXXXXXXXXXX \
        -e SLACK_WEBHOOK_CHANNEL=<SLACK_CHANNEL> \
        limitium/wildcard-letsencrypt-regru



    

### Reload NGINX Container

If you want reload NGINX container after certbot is finished, add the environment variable `NGINX_CONTAINER_NAME`.

    docker run -it --rm \
        -v "$DIR/ssl:/etc/letsencrypt" \
        -v /var/run/docker.sock:/var/run/docker.sock
        -e NGINX_CONTAINER_NAME=<Container Name> \
        -e DOMAIN_NAME=<Your Domain Name> \
        -e CERTBOT_EMAIL=<Your email for certbot> \
        -e REGRU_EMAIL=<Your regru email> \
        -e REGRU_PASS=<Your regru password> \
        limitium/wildcard-letsencrypt-regru

### Staging

    docker run -it --rm \
        -v "$DIR/ssl:/etc/letsencrypt" \
        -e MODE=staging \
        -e DOMAIN_NAME=<Your Domain Name> \
        -e REGRU_EMAIL=<Your regru email> \
        -e REGRU_PASS=<Your regru password> \
        limitium/wildcard-letsencrypt-regru

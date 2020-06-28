#!/bin/bash
#
# Author: Duye Chen
#

if [ -z $1 ]
then
    echo "Usage: ./run.sh [DOMAIN_NAME]"
    exit
fi

DOMAIN_NAME=$1
PATH=$PATH
DIR=`pwd`

########## Modify THIS SECTION #############
# MODE="staging"
CERTBOT_EMAIL="***@gmail.com"
REGRU_EMAIL="***@gmail.com"
REGRU_PASS="***"
CHECK_TIMEOUT=10000
############################################

docker run -it --rm \
    -v "$DIR/ssl:/etc/letsencrypt" \
    -e DOMAIN_NAME=$DOMAIN_NAME \
    -e REGRU_EMAIL=$REGRU_EMAIL \
    -e REGRU_PASS=$REGRU_PASS \
    -e CERTBOT_EMAIL=$CERTBOT_EMAIL \
    -e MODE=$MODE \
    -e CHECK_TIMEOUT=$CHECK_TIMEOUT \
    wildcard-letsencrypt-regru
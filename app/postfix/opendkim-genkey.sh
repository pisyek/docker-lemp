#!/bin/sh

sudo apt install opendkim-tools -y

mkdir keys

for DOMAIN in example.com example.org;
do
    # Generate a key with selector "mail"
    opendkim-genkey -b 2048 -h rsa-sha256 -r -v --subdomains -s mail -d $DOMAIN
   # Fixes https://github.com/linode/docs/pull/620
    sed -i 's/h=rsa-sha256/h=sha256/' mail.txt
    # Move to proper file
    mv mail.private keys/$DOMAIN.private
    mv mail.txt $DOMAIN.txt
done
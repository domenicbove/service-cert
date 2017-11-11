#!/bin/bash

# Generate the pkcs12 file
openssl pkcs12 -export -inkey /etc/amq-certificate-volume/tls.key -in /etc/amq-certificate-volume/tls.crt -out /etc/certs/tls.p12 -password pass:fisopenshift

# Generate the keystore
keytool -importkeystore  -srckeystore /etc/certs/tls.p12 -srcstoretype pkcs12 -destkeystore /etc/amq-secret-volume/broker.ks -storepass fisopenshift  -srcstorepass fisopenshift

# Generate the truststore
keytool -import -keystore /etc/amq-secret-volume/broker.ts -file /etc/amq-certificate-volume/tls.crt -storepass fisopenshift -alias broker

# TODO figure out how to pass in the original startup script
/opt/amq/bin/launch.sh

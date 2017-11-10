#!/bin/bash

# Generate the pkcs12 file
openssl  pkcs12 -export -inkey $KEY_LOCATION -in $CERT_LOCATION -out /etc/certs/tls.p12 -password pass:$STORE_PASS

# Generate the keystore
keytool -importkeystore  -srckeystore /etc/certs/tls.p12 -srcstoretype pkcs12 -destkeystore $AMQ_KEYSTORE_TRUSTSTORE_DIR/$AMQ_KEYSTORE -storepass $AMQ_KEYSTORE_PASSWORD  -srcstorepass $AMQ_KEYSTORE_PASSWORD

# Generate the truststore
keytool -import -keystore $AMQ_KEYSTORE_TRUSTSTORE_DIR/$AMQ_TRUSTSTORE -file $CERT_LOCATION -storepass $AMQ_TRUSTSTORE_PASSWORD -alias broker

# TODO figure out how to pass in the original startup script
/opt/amq/bin/launch.sh

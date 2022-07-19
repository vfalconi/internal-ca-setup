#!/bin/bash

# Setup for root CA
mkdir certs crl newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial

# Setup for intermediate CA
mkdir intermediate
mkdir intermediate/certs intermediate/crl intermediate/csr intermediate/newcerts intermediate/private
chmod 700 intermediate/private
touch intermediate/index.txt
echo 1000 > intermediate/serial
echo 1000 > intermediate/crlnumber

# Add openssl configs for both root and intermediate
cp ./src/root.openssl.cnf ./openssl.cnf
cp ./src/intermediate.openssl.cnf ./intermediate/openssl.cnf

# cleanup
rm -rf .git src
rm -- "$0"
ls -lFAg

echo "All set! Ready for you to create your root and intermediate certificates."

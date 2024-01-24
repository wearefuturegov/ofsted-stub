#!/usr/bin/env ash

curl $SOAP_URL/wsdl?wsdl
echo ""
echo ""
node client.js
echo ""

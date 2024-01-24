#!/usr/bin/env ash

sed -i "s#{{SOAP_URL}}#$SOAP_URL#g" soap/WebExtractServices.wsdl
echo ""
echo ""
node index.js
echo ""

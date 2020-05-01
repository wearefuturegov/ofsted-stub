#!/usr/bin/env bash

curl https://ofsted-feed.herokuapp.com/wsdl?wsdl
echo ""
echo ""
node client.js
echo ""

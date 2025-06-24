#!/bin/bash

echo " Test service1"
curl -s http://localhost:8080/service1/ping && echo
curl -s http://localhost:8080/service1/hello && echo

echo " Test service2"
curl -s http://localhost:8080/service2/ping && echo
curl -s http://localhost:8080/service2/hello && echo


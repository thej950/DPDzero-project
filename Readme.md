# Multi-Service Reverse Proxy Setup with NGINX and Docker

## Project Overview

This project includes:
- Service 1 (Go) — responds on `/hello` and `/ping`
- Service 2 (Flask/Python) — responds on `/hello` and `/ping`

## Service1
 - go language application listens port 8001 
 - app is compiled in a temporary build stage.
 -  final image is small, fast, and contains only what's needed to run the app.
 - curl command  is installed to support healthchecks.
 - The app is ready with port 8001

## service2
 - it is lightweight python container to run Flask app port open 8002
 - uv used as package manager 
 - Builds the app with larger python:slim environment 
 - runs app in alpine environment for reduce image size 
 - Command downloaded curl for healthchecks 
 - dependency handling using uv 
  

# NGINX
 - it is One of the famouse webserver 
 - it supports reverse proxy 
 - it works like LoadBalancing it distribute traffic to backend machines effiently  
 - Here it will access all client request on port 8080 then route backend services /service1/ sends to go app 8001 and /service2/ sends to flask app port 8002
 - it will generate logs to monitor also 

## docker compose 
 - using Docker compose we able to setup multi-container docker app
 - Here we defined 3 services 
    - service1 (Go app) and port expose 8081 
    - service2 (flask app) and port expose 8082
    - nginx maps to port 8080 
 - Here we use custome network bridge network name (dpdzero-nt)
 - volume used on host machone logs folder automatcally created here logs will show 
 

## Setup To App
 - Download code into Local 
 ```bash
 git clone https://github.com/thej950/DPDzero-project.git
 cd DPDzero-project
 docker-compose up -d 
 ```
 
 ```bash
 docker-compose up --build
 ```
 
 
## Test Script 
```bash
chmod +x test.sh
./test.sh
``` 

## logs Folder
 - This folder automatically created into local environment 
 - here we can access logs access.log and error.log 
 ```bash
 cd logs
 ls -la
 ```
  
## To Stop All services
```bash
docker compose down 
```

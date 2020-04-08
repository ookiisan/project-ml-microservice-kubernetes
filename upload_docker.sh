#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
export datetimestamp=$(date '+%Y%m%d%H%M%S')
export imagename=ml-microservice-api
export dockerpath=ookiisan/$imagename

# Step 2:  
# Authenticate & tag
docker login
docker tag $imagename $dockerpath:$datetimestamp
docker tag $imagename $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker push $dockerpath:$datetimestamp
docker push $dockerpath:latest
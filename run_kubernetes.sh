#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
export imagename=ml-microservice-api
export appname=ml-predictions-app
export dockerpath=ookiisan/$imagename

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $appname --generator=run-pod/v1 --image=$dockerpath --port=80 --labels app=$appname

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Wait for pod readiness
kubectl wait --for=condition=Ready pod -l app=$appname --timeout=180s
# Forward the container port to a host
kubectl port-forward $appname 8000:80
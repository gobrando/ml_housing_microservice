#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=gobrando/housing-prediction

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment app --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward app 8000:80

# Log pod name
kubectl logs `kubectl get pods -o=name`
#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=gobrando/housing_prediction

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run app --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl expose deployment app --type=LoadBalancer --port=8080 --target-port=80

# Log pod name
kubectl logs `kubectl get pods -o=name`
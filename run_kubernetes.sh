#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=813213957333.dkr.ecr.us-west-2.amazonaws.com/microservice:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl apply -f microservice-deployment.yaml

# Step 3:
# List kubernetes pods
kubectl get pods -n microservice

# Step 4:
# Forward the container port to a host
kubectl apply -f service.yaml

kubectl get svc -n microservice

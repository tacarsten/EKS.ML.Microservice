#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=813213957333.dkr.ecr.us-west-2.amazonaws.com/microservice

# Step 2:  
# Authenticate & tag
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 813213957333.dkr.ecr.us-west-2.amazonaws.com
echo "Docker ID and Image: $dockerpath"

docker tag microservice:latest 813213957333.dkr.ecr.us-west-2.amazonaws.com/microservice:latest

# Step 3:
# Push image to a docker repository
docker push 813213957333.dkr.ecr.us-west-2.amazonaws.com/microservice:latest

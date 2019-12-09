#!/bin/bash

REGISTRY_URL=registry.docker.com

docker build -t $REGISTRY_URL:5000/ci_container .
docker push $REGISTRY_URL:5000/ci_container:latest

docker-compose up -d

TOKEN="YOURTOKENHERE"
URL="gitlab.yourserver.com"

docker-compose exec \
 gitlab-runner0 /usr/bin/gitlab-runner register -n \
  --url $URL \
  --registration-token $TOKEN \
  --executor docker \
  --description "Docker Runner 0" \
  --docker-image "docker" \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock

docker-compose exec \
 gitlab-runner1 /usr/bin/gitlab-runner register -n \
  --url $URL \
  --registration-token $TOKEN \
  --executor docker \
  --description "Docker Runner 1" \
  --docker-image "docker" \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock

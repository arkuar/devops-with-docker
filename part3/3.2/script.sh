#!/bin/bash
set -e
set -o pipefail

REPOSITORY=
FOLDER=
NAME=

usage()
{
  echo "Script for building and publishing images from git repositories."
  printf "\nUsage: $0 [-h | --help] [-n | --name <docker repository name>] [-u | --user <docker username>] [-t | --token <docker access token>] -r | --repository <github repository>"
  printf "\n-t, --token\n"
  echo "Set the access token for Docker Hub login. If DOCKERHUB_TOKEN env variable exists, you can  omit this option"
  printf "\n-u, --user\n"
  echo "Docker username. If DOCKERHUB_USER env variable exists, you can omit this option" 
  printf "\n-h, --help\n"
  echo "Show help"
  printf "\n-n, --name\n"
  echo "Set image name. Notice that this is should also be the name of the Docker Hub repository"
  printf "\n-r, --repository\n"
  echo "Github repository name. Should be in form <username>/<repository>"
}

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -r | --repository )
    shift; REPOSITORY=git@github.com:${1}.git
    FOLDER=$(basename "$1" .git)
    NAME=$FOLDER
    ;;
  -n | --name )
    shift; NAME=$1
    ;;
  -u | --user )
    shift; DOCKERHUB_USER=$1
    ;;
  -t | --token)
    shift; DOCKERHUB_TOKEN=$1
    ;;
  -h | --help)
    usage
    exit;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

if [[ -z "$REPOSITORY" ]]; then
  echo "Repository is missing"
  exit
fi

# Check that Docker Hub user and token are set
if [[ -z "$DOCKERHUB_USER" ]]; then
  echo "Docker Hub user information is missing!"
  exit
fi

if [[ -z "$DOCKERHUB_TOKEN" ]]; then
  echo "Docker Hub token is missing!"
  exit
fi

if [[ -z NAME ]]; then
  echo "Image name is missing!"
  exit
fi

# Login to Docker Hub
echo "$DOCKERHUB_TOKEN" | docker login -u $DOCKERHUB_USER --password-stdin

# Clone and enter the repository folder
git clone "$REPOSITORY"
cd $FOLDER

# Build image
docker build . -t ""$DOCKERHUB_USER"/"$NAME""

# Push the image
docker push ""$DOCKERHUB_USER"/"$NAME""

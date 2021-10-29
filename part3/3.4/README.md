Image sizes at start:
* Backend: 1.07GB
* Frontend: 1.17GB

After joining the RUN commands, there were no changes to the initial size. This might be due to the base image that is being used. Frontend is using node:14 which is based off of buildpack-deps which contains a lot of common Debian packages making the image quite large. Same goes for the backend using golang:1.16
FROM ubuntu:18.04

WORKDIR /usr/src/app

COPY script.sh .

# Add permissions for the script
RUN chmod +x script.sh

# Install curl in the container so script works
RUN apt-get update; apt-get install curl -y

CMD ./script.sh
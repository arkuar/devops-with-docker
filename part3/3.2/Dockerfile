FROM ubuntu:18.04

WORKDIR /app

RUN apt-get update

RUN apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git

RUN curl -fsSL https://get.docker.com -o ./get-docker.sh
RUN sh get-docker.sh

ADD script.sh .

RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]
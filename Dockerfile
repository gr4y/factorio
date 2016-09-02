# Factorio
# docker run -d -p 34197:34197/udp -v /data/factorio/saves:/opt/factorio/saves --name factorio gr4y/factorio

FROM ubuntu:xenial

MAINTAINER Sascha Wessel <swessel@gr4yweb.de>

# Update System
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Download Factorio Server
RUN mkdir /opt/factorio && cd /opt/factorio
RUN wget https://www.factorio.com/get-download/0.13.20/headless/linux64 -O - | tar -xz

# Install init.sh
ADD run.sh /opt/factorio/
RUN chmod +x /opt/factorio/run.sh

WORKDIR /opt/factorio
VOLUME /opt/factorio

# Run minecraft.service
CMD ["/opt/factorio/run.sh"]

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Grundpakete
RUN apt-get update && \
    apt-get install -y curl gnupg2 apt-transport-https wget software-properties-common

# Webmin GPG Key und Repository
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL http://www.webmin.com/jcameron-key.asc -o /etc/apt/keyrings/webmin.asc
RUN gpg --dearmor -o /etc/apt/keyrings/webmin.gpg /etc/apt/keyrings/webmin.asc
RUN echo "deb [signed-by=/etc/apt/keyrings/webmin.gpg] http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list

# Erst Webmin
RUN apt-get update && \
    apt-get install -y webmin

# Dann iproute2 (separat, falls Webmin sich querstellt)
RUN apt-get update && \
    apt-get install -y iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


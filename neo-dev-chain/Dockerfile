FROM neo-dep:latest
MAINTAINER HenryFour <me@henryfour.com>

# utils
RUN apt-get -y update \
        && apt-get -yq install tmux expect vim net-tools \
        && rm -rf /var/lib/apt/lists/*

# downlaod neo
ENV NEO_VERSION=2.3.5
ENV NEO_CLI_URL=https://github.com/neo-project/neo-cli/releases/download/v$NEO_VERSION/neo-cli-ubuntu.14.04-x64.zip

RUN curl -sSL $NEO_CLI_URL --output /tmp/neo-cli.zip
#COPY ./neo-cli-ubuntu.16.04-x64.zip /tmp/neo-cli.zip

# install multi neo-cli
RUN unzip -q /tmp/neo-cli.zip -d /opt/ \
        && mv /opt/neo-cli /opt/neo-cli-1 \
        && cp -r /opt/neo-cli-1 /opt/neo-cli-2 \
        && cp -r /opt/neo-cli-1 /opt/neo-cli-3 \
        && cp -r /opt/neo-cli-1 /opt/neo-cli-4 \
        && rm /tmp/neo-cli.zip

# copy configs
COPY configs/ /opt/
COPY *.sh /root/

EXPOSE 4001 4101 4201
WORKDIR /root
ENTRYPOINT [ "/root/neo-dev-chain.sh" ]

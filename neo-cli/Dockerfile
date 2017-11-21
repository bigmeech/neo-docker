FROM neo-dep:latest
MAINTAINER HenryFour <me@henryfour.com>

# neo
ENV NEO_VERSION=2.3.5
ENV NEO_CLI_URL=https://github.com/neo-project/neo-cli/releases/download/v$NEO_VERSION/neo-cli-ubuntu.14.04-x64.zip

#COPY ./neo-cli-ubuntu.16.04-x64.zip /tmp/neo-cli.zip
RUN curl -sSL $NEO_CLI_URL --output /tmp/neo-cli.zip
RUN unzip /tmp/neo-cli.zip -d /opt/ && rm /tmp/neo-cli.zip

# config
EXPOSE 10333
WORKDIR /opt/neo-cli
ENTRYPOINT [ "dotnet", "neo-cli.dll" ]

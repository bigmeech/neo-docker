FROM ubuntu:16.04
MAINTAINER HenryFour <me@henryfour.com>

# timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# apt source mirror (mirrors.aliyun.com)
COPY sources.list /etc/apt/sources.list
RUN apt-get -y update

# install common tools
Run apt-get -yq install curl axel unzip locales

# 支持中文
# let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=zh_CN.UTF-8  LANGUAGE=zh_CN:zh  LC_ALL=zh_CN.UTF-8  
RUN locale-gen zh_CN.UTF-8 && dpkg-reconfigure locales && locale-gen zh_CN.UTF-8  

# .NET Framework dependencies
RUN apt-get -y install --no-install-recommends \
        ca-certificates libc6 libcurl3 libgcc1 \
        libgssapi-krb5-2 libicu-dev liblttng-ust0 \
        libssl1.0.0 libstdc++6 libunwind8 libuuid1 zlib1g

# .Net Framework runtime
ENV DOTNET_VERSION=1.1.5
ENV DOTNET_BIN_URL=https://download.microsoft.com/download/6/A/2/6A21C555-B042-46EA-BBB4-368AACCB3E25/dotnet-ubuntu.16.04-x64.$DOTNET_VERSION.tar.gz
# RUN curl -sSL $DOTNET_BIN_URL --output /tmp/dotnet.tar.gz \
RUN axel -q $DOTNET_BIN_URL --output /tmp/dotnet.tar.gz \
    && mkdir -p /opt/dotnet \
    && tar -zxf /tmp/dotnet.tar.gz -C /opt/dotnet \
    && rm /tmp/dotnet.tar.gz \
    && ln -s /opt/dotnet/dotnet /usr/local/bin/dotnet

# neo dependencies
Run apt-get -y install libleveldb-dev sqlite3 libsqlite3-dev

# clean
Run apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* 


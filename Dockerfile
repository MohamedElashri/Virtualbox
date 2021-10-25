FROM debian:buster-slim
LABEL  maintainer "Mohamed Elashri <muhammad.elashri@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    libcurl4 \
	libvpx5 \
	procps \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

    RUN buildDeps=' \
                    ca-certificates \
                    curl \
                    gnupg \
            ' \
	&& set -x \
	&& mkdir -p /etc/xdg/QtProject \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add - \
	&& echo "deb http://download.virtualbox.org/virtualbox/debian buster contrib" >> /etc/apt/sources.list.d/virtualbox.list \
	&& apt-get update && apt-get install -y \
	virtualbox-5.2 \
	--no-install-recommends \
	&& apt-get purge -y --auto-remove $buildDeps       
 
 ENTRYPOINT [ "/usr/bin/virtualbox" ]
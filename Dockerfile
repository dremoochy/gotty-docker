FROM ubuntu:latest as base
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ARG GOTTY_TAG_VER=v1.0.1
ARG GOTTY_ARCH=gotty_linux_amd64.tar.gz
FROM base as fetch
RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sLk https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/${GOTTY_ARCH} \
    | tar xzC /usr/local/bin && \
    apt-get purge --auto-remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*


RUN echo '#!/bin/bash\n\
/usr/local/bin/gotty --permit-write --reconnect /bin/bash' > /run_gotty.sh

RUN chmod 744 /run_gotty.sh

EXPOSE 8080

ENTRYPOINT ["/bin/bash","/run_gotty.sh"]
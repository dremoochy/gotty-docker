FROM ubuntu:latest
LABEL maintainer="dremoochy, forked from hyeonsangjeon/gotty-docker"
LABEL original-maintainer="wingnut0310 <wingnut0310@gmail.com>"
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV GOTTY_TAG_VER=v1.0.1
ENV GOTTY_ARCH=gotty_linux_amd64.tar.gz
RUN apt -y update && \
    apt install -y curl && \
    curl -sLk https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/${GOTTY_ARCH} \
    | tar xzvC /usr/local/bin && \
    apt purge --auto-remove -y curl && \
    apt clean && \
    rm -rf /var/lib/apt/lists*


RUN echo '#!/bin/bash\n\
/usr/local/bin/gotty --permit-write --reconnect /bin/bash' > /run_gotty.sh

RUN chmod 744 /run_gotty.sh

EXPOSE 8080

ENTRYPOINT ["/bin/bash","/run_gotty.sh"]
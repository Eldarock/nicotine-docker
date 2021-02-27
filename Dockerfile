FROM alpine:edge

RUN apk update && apk upgrade && \
    apk add bash shadow dbus \
    xvfb x11vnc ttf-dejavu openbox \
    supervisor py3-pip

RUN apk add novnc nicotine-plus --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    mkdir -p /root/nicotine-downloads && \
    sed -i "s/scale', false/scale', true/" /usr/share/novnc/vnc_lite.html && \
    ln -s /root/nicotine-downloads /usr/share/novnc && \
    rm -rf /var/cache/apk/*

RUN groupmod -g 1000 users && \
    useradd -u 911 -U -d /config -s /bin/false abc && \
    usermod -G users abc && \
    mkdir -p /config

COPY root/ /

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]

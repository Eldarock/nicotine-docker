from alpine:edge
run apk update && apk upgrade && \
 apk add bash supervisor xvfb x11vnc ttf-dejavu openbox dbus
RUN apk add --update --no-cache build-base python3-dev python3 libffi-dev libressl-dev bash git gettext curl \
 && curl -O https://bootstrap.pypa.io/get-pip.py \
 && python3 get-pip.py \
 && pip install --upgrade six awscli awsebcli
run apk add novnc nicotine-plus --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
 mkdir -p /root/nicotine-downloads && \
 sed -i "s/scale', false/scale', true/" /usr/share/novnc/vnc_lite.html && \
 ln -s /root/nicotine-downloads /usr/share/novnc && \
 rm -rf /var/cache/apk/*
add etc /etc
add usr /usr
entrypoint ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
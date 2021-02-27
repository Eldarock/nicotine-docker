#!/usr/bin/env bash

/usr/local/bin/userconf.sh

exec /usr/bin/supervisord -c /etc/supervisord.conf

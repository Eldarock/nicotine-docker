#!/bin/bash

PUID=${PUID:-911}
PGID=${PGID:-911}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

echo "
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-------------------------------------
"
chown abc:abc /config

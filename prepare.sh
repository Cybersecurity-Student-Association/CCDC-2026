#!/bin/bash

mkdir -p /usr/share/CCDC-2026/
cp * /usr/share/CCDC-2026/ -R
cp .* /usr/share/CCDC-2026/ -R

source /usr/share/CCDC-2026/activate.sh
chmod +x *.sh


/usr/share/CCDC-2026/copy.sh


touch /var/log/adversary.log
chmod 662 /var/log/adversary.log

if ! grep -Eq '^[^#]*\s+/tmp\s+tmpfs\s+' /etc/fstab; then
    echo "tmpfs /tmp tmpfs defaults,noexec,nosuid,nodev 0 0" >> /etc/fstab
    mount -a
fi


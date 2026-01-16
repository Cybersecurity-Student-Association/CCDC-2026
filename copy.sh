#!/bin/bash

source /usr/share/CCDC-2026/activate.sh

backup /etc $TARGET_DIR/backups/initial
backup /usr/bin $TARGET_DIR/backups/initial/usr
backup /usr/sbin $TARGET_DIR/backups/initial/usr
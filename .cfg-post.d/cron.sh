#!/bin/sh

crontab -l > ${XDG_DATA_HOME:-~/.local/share}/crontab.backup

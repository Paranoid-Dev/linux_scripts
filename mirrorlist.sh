#!/bin/bash

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old$(date +'%Y-%m-%d')
# sudo reflector --verbose -l 200 -n 20 -p http,https --sort rate --save /etc/pacman.d/mirrorlist
sudo reflector --verbose -l 200 -n 20 -p https --sort rate --save /etc/pacman.d/mirrorlist

#!/bin/sh

sudo qemu-system-x86_64 \
    -name qemu-iso \
    -cpu host \
    -machine type=pc,accel=kvm \
    -enable-kvm \
    -m 4096 \
    -vga qxl \
    -rtc base=localtime \
    -cdrom "$1"

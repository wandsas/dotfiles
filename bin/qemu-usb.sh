#!/bin/sh

DEVICE="${1:-/dev/disk/by-id/usb-SanDisk_Ultra_USB_3.0_4C530001171219104105-0:0}"

sudo qemu-system-x86_64 \
    -name multiboot \
    -cpu host \
    -machine type=pc,accel=kvm \
    -enable-kvm \
    -m 4096 \
    -vga qxl \
    -rtc base=localtime \
    -drive file=$DEVICE,readonly,cache=none,if=virtio

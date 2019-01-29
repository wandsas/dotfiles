#!/bin/sh

source ~/lib/stdout.sh
source ~/lib/check_com.sh

ENABLE_DMCRYPT_LUKS=

IMAGE="${1:-/root/myimage.img}"
LABEL="${IMAGE##*/}"
SIZE="${2:-256}"

[[ "$#" != 2  ]] && die "Usage:${0##*/} <path/to/image> <size> [mb]"

check_com cryptsetup || die "cryptsetup binary not found, aborted"

# Create image file
#sudo head -c $SIZE /dev/zero > $IMAGE
sudo dd if=/dev/zero of=$IMAGE bs=1024 count=$SIZE

# Map image to loop device
lodev=$(losetup --find)
sudo losetup $lodev $IMAGE

if [ -n "$ENABLE_DMCRYPT_LUKS" ]; then
    sudo cryptsetup luksFormat $lodev
    sudo cryptsetup luksOpen $lodev $LABEL
else
    sudo cryptsetup -c twofish -s 128 -y create $LABEL $lodev
fi

sudo losetup -d $lodev

install -d /mnt/$LABEL
sudo mount /dev/mapper/$LABEL /mnt/$LABEL

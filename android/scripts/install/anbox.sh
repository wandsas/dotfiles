#!/bin/bash

# Install 2 mandatory kernel subsystems "ashmem" and "binder" for the Android container.
# (anbox github repository https://github.com/anbox/anbox-modules).

# We use the existing Ubuntu apt-repository maintained by anbox.

# We install this, in case add-apt-repository is missing:
sudo apt-get install software-properties-common
# Add anbox repository
sudo add-apt-repository ppa:morphis/anbox-support
sudo apt update

# The kernel subsystems ashmem and binder are automatically rebuild every time the
# kernel packages on our system update.

# Please be aware, that the Dynamic Kernel Module Support (DKMS) is rebuild every time
# an Ubuntu Linux System update an installed kernel module.
# man dkms(8)

# Please read the manual page man dkms for more detailed information about dkms.
# Please  be aware that on most Ubuntu containers and virtual machines the manual pages
# are not included to keep the system image so small as possible.
# Read the manuals on your host system or install them with something like:
# sudo apt-get install man-db manpages-posix manpages-posix manpages-posix-dev 

sudo apt-get install anbox-kernel-modules linux-header-generic
# executed 
sudo apt install -y linux-headers-generic anbox-modules-dkms

# Load our new modules manual
sudo modprobe ashmem_linux
sudo modprobe binder_linux

# Now two new nodes should appear on your system
ls -l /dev/{ashmem,binder}
/dev/ashmem
/dev/binder

Please refer to the anbox documentation, in case you want more detailed information
about the anbox kernel modules and using anbox container to run android system images in general: https://docs.anbox.io/userguide/install_kernel_modules.html.

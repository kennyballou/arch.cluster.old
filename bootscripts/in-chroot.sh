#!/bin/sh

set -o nounset
set -o errexit


if [ $# -eq 0 ]; then
    echo "usage: $0 <node#>"
    exit 1
fi

if [ $1 -le 0 ] || [ $1 -ge 100 ]; then
    # TODO: could ping to see if it already exists
    echo "node# must be integer between 1 and 99"
    exit 1
fi


node_number=$1

master_ip=192.168.1.100
node_ip=192.168.1.1${node_number}
hostname=node${node_number}
netmask=24
broadcast=192.168.1.255


# locale
locale-gen

# timezone
ln -s /usr/share/zoneinfo/America/Boise /etc/localtime

# hardware clock
hwclock --systohc --utc

# hostname
echo ${hostname} > /etc/hostname

# rebuild initial ramdisk to include lvm
mkinitcpio -p linux

# initialize initial root password
echo "root:root" | chpasswd

# install base packages
pacman --noconfirm -S syslinux iproute2 openssh zsh vim mlocate

# setup syslinux
#   (installing syslinux through pacman writes syslinux.cfg - install ours)
mv /boot/syslinux/syslinux.cfg.REPLACE /boot/syslinux/syslinux.cfg
syslinux-install_update -iam

# setup static network
mkdir -p /etc/conf.d
cat > /etc/conf.d/network << EOF
interface=eth0
address=${node_ip}
netmask=${netmask}
broadcast=${broadcast}
EOF
#gateway=${master_ip}

# enable systemd services
systemctl enable network.service
systemctl enable lvm.service
systemctl enable sshd.service


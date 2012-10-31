#!/bin/sh

MIN_NODE=1
MAX_NODE=199

set -o nounset
set -o errexit


if [ $# -eq 0 ]; then
    echo "usage: $0 <node#>"
    exit 1
fi

if [ $1 -lt ${MIN_NODE} ] || [ $1 -gt ${MAX_NODE} ]; then
    echo "node# must be integer between ${MIN_NODE} and ${MAX_NODE}"
    exit 1
fi


node_number=$1

master_ip=192.168.1.254     # could get this from the dhcp server
node_ip=192.168.1.${node_number}
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
pacman --noconfirm -S syslinux iproute2 openssh zsh vim salt-git

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
gateway=${master_ip}
EOF

cat >> /etc/hosts << EOF
${master_ip} bsu-vis.boisestate.edu bsu-vis master salt
EOF

# enable systemd services
systemctl enable network.service
systemctl enable lvm.service
systemctl enable sshd.service
systemctl enable salt-minion.service


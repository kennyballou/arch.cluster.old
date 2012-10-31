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


###############################
# prepare hard drive
modprobe dm-mod     # probably already loaded, but doesn't hurt
vgremove -f VolGroup00 || true      # ignore error code

# check /dev/sda is as expected (big enough)

# erase current partition table
dd if=/dev/zero of=/dev/sda bs=512 count=1
# initialize new disk label
parted /dev/sda mklabel msdos

# create boot partition (512MB)
parted /dev/sda mkpart primary 1 512
parted /dev/sda set 1 boot on
mkfs.ext4 -L boot /dev/sda1

# allocate rest of device as LVM volume
parted /dev/sda -- mkpart primary 512 -0
parted /dev/sda set 2 lvm on
# create physical volume
pvcreate /dev/sda2
# create volume group
vgcreate VolGroup00 /dev/sda2
# create logical volumes
lvcreate -C y -L 5G VolGroup00 -n lvolswap
lvcreate -L 15G VolGroup00 -n lvolroot
# XXX: home will be NFS
# XXX: var can be added in the future if needed

mkswap -L swap /dev/mapper/VolGroup00-lvolswap
mkfs.ext4 -L root /dev/mapper/VolGroup00-lvolroot


###############################
# mount the hard drives
swapon /dev/mapper/VolGroup00-lvolswap
mount /dev/mapper/VolGroup00-lvolroot /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot


###############################
# install base system / setup config files
cp mntfiles/etc/pacman.conf /etc/pacman.conf
pacstrap /mnt base base-devel
# generate fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

# copy premade config files to /mnt
rsync -avz mntfiles/ /mnt/

arch-chroot /mnt `pwd`/in-chroot.sh ${node_number}

umount /mnt/boot
umount /mnt

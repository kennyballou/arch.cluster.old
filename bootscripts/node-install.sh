#!/bin/bash

set -o nounset
set -o errexit

SCRIPT_NAME=`basename $0`
pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null


NODE_NUMBER=0
MIN_NODE=1
MAX_NODE=199

INSTALL_HDD=/dev/sda
BOOT_PART=/dev/sda1
LVM_PART=/dev/sda2


prepare_hdd() {
    # check ${INSTALL_HDD} is not Live media (or already mounted)
    if mount | grep ${INSTALL_HDD}; then
        echo "${INSTALL_HDD} appears to already be mounted - bailing"
        exit 1
    fi

    # TODO: check ${INSTALL_HDD} is large enough

    modprobe dm-mod     # probably already loaded, but doesn't hurt
    vgremove -f VolGroup00 || true      # ignore error code

    # erase current partition table
    dd if=/dev/zero of=${INSTALL_HDD} bs=512 count=1
    # initialize new disk label
    parted ${INSTALL_HDD} mklabel msdos

    # create boot partition (512MB)
    parted ${INSTALL_HDD} mkpart primary 1 512
    parted ${INSTALL_HDD} set 1 boot on
    mkfs.ext4 -L boot ${BOOT_PART}

    # allocate rest of device as LVM volume
    parted ${INSTALL_HDD} -- mkpart primary 512 -0
    parted ${INSTALL_HDD} set 2 lvm on
    # create physical volume
    pvcreate ${LVM_PART}
    # create volume group
    vgcreate VolGroup00 ${LVM_PART}
    # create logical volumes
    lvcreate -C y -L 5G VolGroup00 -n lvolswap
    lvcreate -L 15G VolGroup00 -n lvolroot
    # home is mounted on NFS
    # XXX: var can be added in the future if needed

    mkswap -L swap /dev/mapper/VolGroup00-lvolswap
    mkfs.ext4 -L root /dev/mapper/VolGroup00-lvolroot
}


mount_partitions() {
    swapon /dev/mapper/VolGroup00-lvolswap
    mount /dev/mapper/VolGroup00-lvolroot /mnt
    mkdir -p /mnt/boot
    mount ${BOOT_PART} /mnt/boot
}

unmount_partitions() {
    umount /mnt/boot
    umount /mnt
    swapoff /dev/mapper/VolGroup00-lvolswap
}


bootstrap_system() {
    # copy premade config files to /mnt
    cp pacman.conf /etc/pacman.conf
    pacstrap /mnt base base-devel
    rsync -avz mntfiles/ /mnt/

    # generate fstab
    genfstab -U -p /mnt >> /mnt/etc/fstab
}



live_install_main() {
    prepare_hdd
    mount_partitions
    bootstrap_system

    cp ${SCRIPT_PATH}/${SCRIPT_NAME} /mnt/root/${SCRIPT_NAME}

    # call this same script except now use 'chrootstage'
    arch-chroot /mnt /root/${SCRIPT_NAME} ${NODE_NUMBER} in-chroot 

    rm /mnt/root/${SCRIPT_NAME}

    unmount_partitions
}



chroot_stage_main() {
    DOMAIN=viz
    MASTER_IP=192.168.1.254     # could get this from the dhcp server
    NODE_IP=192.168.1.${NODE_NUMBER}
    HOSTNAME=node${NODE_NUMBER}
    NETMASK=24
    BROADCAST=192.168.1.255

    locale-gen
    ln -s /usr/share/zoneinfo/America/Boise /etc/localtime
    hwclock --systohc --utc
    echo ${HOSTNAME} > /etc/hostname

    # rebuild initial ramdisk to include lvm
    mkinitcpio -p linux

    # initialize initial root password
    echo "root:root" | chpasswd

    # setup syslinux
    pacman --noconfirm -S syslinux
    mv /boot/syslinux/syslinux.cfg.REPLACE /boot/syslinux/syslinux.cfg
    syslinux-install_update -iam

    # setup networking
    pacman --noconfirm -S iproute2 openssh
    mkdir -p /etc/conf.d
    cat > /etc/conf.d/network << EOF
interface=eth0
address=${NODE_IP}
netmask=${NETMASK}
broadcast=${BROADCAST}
gateway=${MASTER_IP}
EOF

    cat > /etc/resolv.conf << EOF
domain ${DOMAIN}
nameserver ${MASTER_IP}
EOF

#    cat >> /etc/hosts << EOF
#EOF

    # setup NFS /home mount
    pacman --noconfirm -S nfs-utils nfsidmap
    mv /etc/idmapd.conf.REPLACE /etc/idmapd.conf
    cat >> /etc/fstab << EOF
# NFSv4 home mount
${MASTER_IP}:/home    				/home   	nfs4    	rsize=8192,wsize=8192,intr,noauto,x-systemd.automount  0 0
EOF

    # TODO: setup ntp
    pacman --noconfirm -S ntp

    # setup sudo
    pacman --noconfirm -S sudo
    chown root:root /etc/sudoers.REPLACE
    mv /etc/sudoers.REPLACE /etc/sudoers

    # install other basic _necessities_
    #   (don't go overboard here - we'll install other packages later)
    pacman --noconfirm -S sudo zsh rsync vim

    # enable systemd services (has return code of 1 so disable errexit)
    set +o errexit
    systemctl enable network.service
    systemctl enable sshd.service
    systemctl enable nfsd.service rpc-idmapd.service
    systemctl enable ntpd.service
    set -o errexit
}



##################################################
# main program entry logic
##################################################

ACTION=full_install

# parse arguments
declare -a args
while (( $# )); do
    case "$1" in
        #-q|--quiet) QUIET=1;;
        in-chroot)
            ACTION=in-chroot;;
        partition)
            ACTION=partition;;
        mount)
            ACTION=mount;;
        umount)
            ACTION=umount;;
        bootstrap)
            ACTION=bootstrap;;
        *)
            args+=("$1")
            ;;
    esac
    shift
done

# test for minimum number of arguments
if [[ -z ${args[0]-} ]]; then
    echo "TODO: make a better usage error message"
    exit 1
fi


NODE_NUMBER=${args[0]}
if [ $NODE_NUMBER -lt $MIN_NODE ] || [ $NODE_NUMBER -gt $MAX_NODE ]; then
    echo "node# must be integer between ${MIN_NODE} and ${MAX_NODE}"
    exit 1
fi


case "$ACTION" in
    full_install)
        live_install_main;;
    in-chroot)
        chroot_stage_main;;
    mount)
        mount_partitions;;
    umount)
        unmount_partitions;;
    bootstrap)
        bootstrap_system;;
    *)
        exit 1;;
esac


#!/bin/bash

REPO_DB=/srv/http/arch.repo/local.db.tar.gz
REPO_DIR=$(dirname ${REPO_DB})


# make symlinks to any new packages in /var/cache/pacman/pkg/
diff -r /var/cache/pacman/pkg ${REPO_DIR} |\
    grep -v "Only in ${REPO_DIR}" |\
    awk '{print $4}' |\
    xargs -I PKGNAME ln -s /var/cache/pacman/pkg/PKGNAME ${REPO_DIR}/PKGNAME

# delete any broken symlinks
find -L ${REPO_DIR} -type l -delete

# update the db
repo-add ${REPO_DB} ${REPO_DIR}/*.pkg.tar.xz

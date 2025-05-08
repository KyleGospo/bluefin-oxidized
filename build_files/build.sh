#!/bin/bash

set -ouex pipefail

dnf5 install -y sudo-rs rust-coreutils

ln -sf su-rs /usr/bin/su
ln -sf sudo-rs /usr/bin/sudo
ln -sf visudo-rs /usr/bin/visudo

for library in /usr/bin/uu_*; do
    libraryname=$(basename "$library")
    link="/usr/bin/${libraryname#uu_}"
    original="/usr/libexec/uutils-coreutils/${libraryname#uu_}"
    ln -sf $original $link
done

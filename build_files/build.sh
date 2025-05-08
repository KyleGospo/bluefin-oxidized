#!/bin/bash

set -ouex pipefail

dnf5 install -y sudo-rs uutils-coreutils

ln -sf /usr/bin/su-rs /usr/bin/su
ln -sf /usr/bin/sudo-rs /usr/bin/sudo
ln -sf /usr/bin/visudo-rs /usr/bin/visudo

for library in /usr/bin/uu_*; do
    libraryname=$(basename "$library")
    link="/usr/bin/${libraryname#uu_}"
    original="/usr/libexec/uutils-coreutils/${libraryname#uu_}"
    ln -sf $original $link
done

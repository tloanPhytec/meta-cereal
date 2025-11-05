require recipes-images/images/phytec-headless-image.bb

IMAGE_INSTALL:append = " \
	lvgl-demo-fb \
	packagegroup-base \
"

IMAGE_FEATURES += "\
    ssh-server-openssh \
    hwcodecs \
"

ROOTFS_POSTPROCESS_COMMAND += " remove_tty1_service; "

# remove getty@tty1.service and getty@.service
remove_tty1_service () {
    rm -f ${IMAGE_ROOTFS}/lib/systemd/system/getty@.service
    rm -f ${IMAGE_ROOTFS}/etc/systemd/system/getty.target.wants/getty@tty1.service
}

COMPATIBLE_MACHINE .= "|phyboard-rigel-am67xx-1"

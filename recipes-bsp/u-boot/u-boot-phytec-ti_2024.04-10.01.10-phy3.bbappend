COMPATIBLE_MACHINE .= "|phyboard-lyra-am62xx-3"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " file://0001-Enable-LCD185-by-default-for-Demo.patch \
           "

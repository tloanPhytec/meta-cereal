COMPATIBLE_MACHINE .= "|phyboard-lyra-am62xx-3"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-Fixes-inverted-touch-control-on-old-LCD185.patch \
	"

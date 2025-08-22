FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-Modify-default-example-for-PHYTEC-Food-Drive.patch \
            file://0001-Disable-PTHREAD-and-THORVG.patch \
            file://lvgl-demo.service \
            file://cereal_bowl-labeled.png  \
            file://PHYTEC-logo.png \
	"

inherit systemd

SYSTEMD_SERVICE:${PN} = "lvgl-demo.service"

SYSTEMD_AUTO_ENABLE:${PN} = "enable"

FILES:${PN} += "${systemd_unitdir}/lvgl-demo.service"

ASSETDIR = "${datadir}/phytec-lvgl-demo/assets"
do_install:append() {
    install -Dm 0644 ${WORKDIR}/lvgl-demo.service ${D}${systemd_system_unitdir}/lvgl-demo.service

    install -d ${D}${ASSETDIR}
    install -m0644 ${WORKDIR}/cereal_bowl-labeled.png ${D}${ASSETDIR}/
    install -m0644 ${WORKDIR}/PHYTEC-logo.png         ${D}${ASSETDIR}/    
}

FILES:${PN} += " \
	${systemd_unitdir}/lvgl-demo.service \
	${ASSETDIR} \
"

PACKAGECONFIG:remove = "drm"
PACKAGECONFIG:append = " fbdev"	

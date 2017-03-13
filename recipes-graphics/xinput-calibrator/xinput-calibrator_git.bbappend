# Run TimoChess after calibration
# Else Timochess show up on top on callibration and it does not work well !
# Xavier Hosxe 2017

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "\
            file://xinput_calibrator_once_timochess.sh \
        "


do_install_append() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/../xinput_calibrator_once_timochess.sh ${D}${bindir}/xinput_calibrator_once_timochess.sh

    install -d ${D}${sysconfdir}/X11/Xsession.d/
    install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/

    install -d ${D}${sysconfdir}/xdg/autostart
    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once_timochess.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
}

FILES_${PN} += "${sysconfdir}/xdg/autostart"
RDEPENDS_${PN} = "xinput formfactor xrandr"
RRECOMMENDS_${PN} = "pointercal-xinput"

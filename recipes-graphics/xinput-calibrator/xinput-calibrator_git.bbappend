# Run TimoChess after calibration
# Else Timochess show up on top on callibration and it does not work well !
# Xavier Hosxe 2017

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "\
            file://xinput_calibrator_once_timochess.sh \
        "

WAVESHARE5="${@bb.utils.contains("MACHINE_FEATURES", "waveshare5", "1", "0", d)}"
WAVESHARE7_1024="${@bb.utils.contains("MACHINE_FEATURES", "waveshare7_1024", "1", "0", d)}"

do_install_append() {
    install -d ${D}${bindir}
    if [ "${WAVESHARE5}" = "1" ]; then
        install -m 0755 ${S}/../xinput_calibrator_once_timochess.sh ${D}${bindir}/xinput_calibrator_once_timochess.sh
    fi

    if [ "${WAVESHARE7_1024}" = "1" ]; then
        sed -e 's,^RESOLUTION=800x480,RESOLUTION=1024x600,' ${S}/../xinput_calibrator_once_timochess.sh > ${S}/../xinput_calibrator_once_timochess_1024.sh
        install -m 0755 ${S}/../xinput_calibrator_once_timochess_1024.sh ${D}${bindir}/xinput_calibrator_once_timochess.sh
    fi

    install -d ${D}${sysconfdir}/X11/Xsession.d/
    install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/

    install -d ${D}${sysconfdir}/xdg/autostart
    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once_timochess.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
}

FILES_${PN} += "${sysconfdir}/xdg/autostart"
RDEPENDS_${PN} = "xinput formfactor xrandr"
RRECOMMENDS_${PN} = "pointercal-xinput"

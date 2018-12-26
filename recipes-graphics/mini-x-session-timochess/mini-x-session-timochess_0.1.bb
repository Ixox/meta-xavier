SUMMARY = "Very simple session manager for X"

PR = "r1"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://mini-x-session-timochess-waveshare5;md5=aa64b89056208c124245a0714de7c8b8"

SECTION = "x11"

SRC_URI = "file://mini-x-session-timochess-waveshare5 file://mini-x-session-timochess-waveshare7_1024"
S = "${WORKDIR}"

RDEPENDS_${PN} = "sudo"

inherit update-alternatives

ALTERNATIVE_${PN} = "x-session-manager"
ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/mini-x-session-timochess"
ALTERNATIVE_PRIORITY = "49"

WAVESHARE5="${@bb.utils.contains("MACHINE_FEATURES", "waveshare5", "1", "0", d)}"
WAVESHARE7_1024="${@bb.utils.contains("MACHINE_FEATURES", "waveshare7_1024", "1", "0", d)}"


do_install() {
	install -d ${D}/${bindir}
    if [ "${WAVESHARE5}" = "1" ]; then
		install -m 0755 ${S}/mini-x-session-timochess-waveshare5 ${D}/${bindir}/mini-x-session-timochess
	fi
    if [ "${WAVESHARE7_1024}" = "1" ]; then
		install -m 0755 ${S}/mini-x-session-timochess-waveshare7_1024 ${D}/${bindir}/mini-x-session-timochess
	fi
}

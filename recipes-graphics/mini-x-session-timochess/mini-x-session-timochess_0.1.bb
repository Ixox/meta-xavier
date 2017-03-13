SUMMARY = "Very simple session manager for X"

PR = "r1"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://mini-x-session-timochess;md5=7059a7daa28cec9fa5a2a62dc8bb2c1a"

SECTION = "x11"

SRC_URI = "file://mini-x-session-timochess"
S = "${WORKDIR}"

RDEPENDS_${PN} = "sudo"

inherit update-alternatives

ALTERNATIVE_${PN} = "x-session-manager"
ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/mini-x-session-timochess"
ALTERNATIVE_PRIORITY = "49"

do_install() {
	install -d ${D}/${bindir}
	install -m 0755 ${S}/mini-x-session-timochess ${D}/${bindir}
}

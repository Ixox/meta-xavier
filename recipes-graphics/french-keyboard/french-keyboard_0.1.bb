SRC_URI = "file://11-keyboard-fr.conf"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://11-keyboard-fr.conf;md5=27046a148f404e49f65a0d8dbc2247a0" 


S = "${WORKDIR}"

do_install () {
 	install -d ${D}${sysconfdir}/X11/xorg.conf.d/
	install -m 0644 ${WORKDIR}/11-keyboard-fr.conf ${D}${sysconfdir}/X11/xorg.conf.d/
}



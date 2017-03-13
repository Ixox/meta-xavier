DESCRIPTION = "Stockfish modified by ddugovic (variants available)" 
SECTION = "games" 
LICENSE = "GPLv3+" 
LIC_FILES_CHKSUM = "file://Copying.txt;md5=3c34afdc3adf82d2448f12715a255122" 
PR = "r0" 
SRC_URI = "git://github.com/ddugovic/Stockfish.git;branch=master;protocol=git" 
SRC_URI[md5sum] = "f3e78a7ce8aded04531e3cb45d693a29"
SRC_URI += "file://0001-Makefile-new-crosscompile-build.patch"
SRCREV = "4a4dffc57868069d262b5b11eda9a55d250c8e22"

S = "${WORKDIR}/git"

#inherit autotools  

export COMP = "crosscompile"
export ARCH = "armv7"

do_configure() {
}


do_compile() {
	cd ${S}/src
	oe_runmake build
}

do_install() {
	install -d ${D}${bindir}
	install -m 0755 ${WORKDIR}/git/src/stockfish ${D}${bindir}/stockfishVariant	
}


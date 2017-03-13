inherit juce

JUCE_JUCERS = "${WORKDIR}/home/xavier/dev/TimoChess/TimoChess.jucer"
JUCE_MODULES = "juce_core juce_events juce_graphics juce_data_structures juce_gui_basics juce_gui_extra"
SRC_URI = "file:///home/xavier/dev/TimoChess \
           file://OpenDyslexicAlta-Bold.otf \
"
LICENSE="MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=f3e38c1f1e0db893f5e9a1b4328246d3" 

DEPENDS_prepend = "stockfish "

S = "${WORKDIR}/home/xavier/dev/TimoChess"
B = "${WORKDIR}/home/xavier/dev/TimoChess/Builds"

FILES_${PN} += "${datadir}/fonts/opentype"


do_compile() {
  cd ${B}/LinuxMakefile
  
  TARGET_ARCH="-march=armv7-a" CONFIG=Release oe_runmake
}

do_install() {
	install -d ${D}${bindir}
  install -D ${B}/LinuxMakefile/build/TimoChess ${D}${bindir}/TimoChess
  install -d ${D}${datadir}/fonts/opentype/
  install -m 0644 ${WORKDIR}/OpenDyslexicAlta-Bold.otf ${D}${datadir}/fonts/opentype/
}

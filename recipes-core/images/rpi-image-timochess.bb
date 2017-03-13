# Base this image on core-image-x11.bb

include recipes-graphics/images/core-image-x11.bb

LICENSE="MIT"

IMAGE_INSTALL += " \
	kernel-modules \
    stockfish \
    timochess \
    mini-x-session-timochess \
    french-keyboard \
	"


# Set Raspberrypi splash image
SPLASH = "psplash-raspberrypi"
IMAGE_FEATURES += "ssh-server-dropbear splash"

TOOLCHAIN_HOST_TASK += "nativesdk-projucer"

#usefull ?
MACHINE_FEATURES+= " vc4graphics "

# Turbo mode
ARM_FREQ = "1000"
CORE_FREQ = "500"
SDRAM_FREQ = "500"
OVER_VOLTAGE = "2"

DISABLE_OVERSCAN = "1"

GPU_MEM = "128"

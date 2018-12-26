# To build the full timochess image

Download poky-morty. Yocto v2.2.
Put "meta-xavier" repository among the other meta.

In the main poky-morty folder :  
source oe-init-build-env build/rpi  
bitbake rpi-image-timochess

After a couple of hours of downloading/compiling/packaging a full Linux distribution is here :    ./tmp/deploy/images/raspberrypi2/rpi-image-timochess-raspberrypi2-*.rootfs.rpi-sdimg 

You can use etcher or dd to flash your SD card.


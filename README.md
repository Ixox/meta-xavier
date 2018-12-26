# To build the full timochess image

. oe-init-build-env build/rpi
bitbake rpi-image-timochess

After a couple of houres of compiling a full Linux distribution,
the image is ./tmp/deploy/images/raspberrypi2/rpi-image-timochess-raspberrypi2-*.rootfs.rpi-sdimg 

You can use etcher or dd to flash your SD card.


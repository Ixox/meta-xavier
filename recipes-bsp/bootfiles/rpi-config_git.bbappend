SRCREV = "648ffc470824c43eb0d16c485f4c24816b32cd6f"

do_deploy_append() {

    echo "" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    WAVESHARE5="${@bb.utils.contains("MACHINE_FEATURES", "waveshare5", "1", "0", d)}"
    WAVESHARE7_1024="${@bb.utils.contains("MACHINE_FEATURES", "waveshare7_1024", "1", "0", d)}"

    echo "# SD card driver overclocking" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "dtoverlay=sdhost,overclock_50=100" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt    
    echo "# Rainbow boot no interpolation" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "scaling_kernel=8" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt    


    if [ "${WAVESHARE5}" = "1" ]; then
        echo "# Waveshare HDMI 5 inches TFT" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_force_hotplug=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_group=2" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_mode=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_mode=87" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_cvt 800 480 60 6 0 0 0" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "max_usb_current=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt    
        echo "" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "# Waveshare Touchscreen driver" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "dtoverlay=ads7846,cs=1,penirq=25,penirq_pull=2,speed=50000,keep_vref_on=0,swapxy=0,pmax=255,xohms=150,xmin=200,xmax=3900,ymin=200,ymax=3900" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi

    if [ "${WAVESHARE7_1024}" = "1" ]; then
        echo "# Waveshare HDMI 7 (1024x600) inches TFT" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_force_hotplug=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_group=2" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_mode=87" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "hdmi_cvt 1024 600 60 6 0 0 0" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "max_usb_current=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt    
        echo "hdmi_drive=1" >>${DEPLOYDIR}/bcm2835-bootfiles/config.txt    
    fi
}

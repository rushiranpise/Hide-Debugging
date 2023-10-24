#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != 1 ]; do
    sleep 1
done

{
    while true; do
        resetprop -n init.svc.adbd stopped
        resetprop -n sys.usb.ffs.ready 0
        resetprop -n sys.usb.state mtp
        resetprop -n sys.usb.config mtp
        resetprop -n persist.sys.usb.reboot.func mtp
        sleep 1;
    done
} &

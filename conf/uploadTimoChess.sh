#!/bin/bash

cp  ./tmp/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/timochess/1.0-r0/deploy-rpms/cortexa7hf_neon_vfpv4/timochess-1.0-r0.cortexa7hf_neon_vfpv4.rpm .

echo ">> Copying timochess package on the raspberry pi 2..."
export SSHPASS=
sshpass -e sftp -oBatchMode=no -b - root@192.168.2.21 << !
   cd /home/root
   put timochess-1.0-r0.cortexa7hf_neon_vfpv4.rpm
   bye
!

rsh -l root "192.168.2.21" << !
echo ">> Kill TimoChess..."
killall TimoChess
echo ">> Installing timochess..."
cd /home/root
rpm -Uhv --force  timochess-1.0-r0.cortexa7hf_neon_vfpv4.rpm
sync
echo ">> Run the NEW TimoChess..."
TimoChess &
exit
!

echo ">> Done"




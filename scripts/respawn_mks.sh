#!/bin/bash

cd /opt/openwrt_packit
cp make.env makeplus.env
cp make.env makeplusplus.env
cp make.env makeplusplusplus.env

#sync the kernel version
KV=$(find /opt/kernel/ -name "boot*+o.tar.gz" | awk -F '[-.]' '{print $2"."$3"."$4"-"$5"-"$6}')
KPV=$(find /opt/kernel/ -name "boot-5\.17*+.tar.gz" | awk -F '[-.]' '{print $2"."$3"."$4"-"$5"-"$6}')
KPPV=$(find /opt/kernel/ -name "boot-5\.15*+.tar.gz" | awk -F '[-.]' '{print $2"."$3"."$4"-"$5"-"$6}')
KPPPV=$(find /opt/kernel/ -name "boot-5\.16*+.tar.gz" | awk -F '[-.]' '{print $2"."$3"."$4"-"$5"-"$6}')
sed -i "s/^    KERNEL_VERSION.*/    KERNEL_VERSION=\"$KV\"/" make.env
sed -i "s/^    KERNEL_VERSION.*/    KERNEL_VERSION=\"$KPV\"/" makeplus.env
sed -i "s/^    KERNEL_VERSION.*/    KERNEL_VERSION=\"$KPPV\"/" makeplusplus.env
sed -i "s/^    KERNEL_VERSION.*/    KERNEL_VERSION=\"$KPPPV\"/" makeplusplusplus.env

for F in *.sh ; do cp $F ${F%.sh}_plus.sh && cp $F ${F%.sh}_plusplus.sh && cp $F ${F%.sh}_plusplusplus.sh;done
find ./* -maxdepth 1 -path "*_plus.sh" | xargs -i sed -i 's/make\.env/makeplus\.env/g' {}
find ./* -maxdepth 1 -path "*_plusplus.sh" | xargs -i sed -i 's/make\.env/makeplusplus\.env/g' {}
find ./* -maxdepth 1 -path "*_plusplusplus.sh" | xargs -i sed -i 's/make\.env/makeplusplusplus\.env/g' {}
find ./*_plus.sh ./*_plusplus.sh ./*_plusplusplus.sh  -maxdepth 1 -path "*" | xargs -i sed -i 's/OP_ROOT_TGZ=\"openwrt/OP_ROOT_TGZ=\"openwrt/g' {}
find ./*_plus.sh ./*_plusplus.sh ./*_plusplusplus.sh  -maxdepth 1 -path "*" | xargs -i sed -i 's/TGT_IMG=\"\${WORK_DIR}\/openwrt/TGT_IMG=\"\${WORK_DIR}\/openwrt/g' {}


echo "mk_files respawned."

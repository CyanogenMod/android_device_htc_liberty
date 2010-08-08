#!/bin/bash  
stime=`date +%C%y%m%d:%H%M%S`
rm -R ~/android-cm/out
rm -R ~/android-cm/vendor/htc/liberty
cd ~/android-cm/device/htc/liberty
sh copy-files.sh
cd ~/android-cm
source build/envsetup.sh
lunch cyanogen_liberty-eng
make acp
make -j4 otapackage
etime=`date +%C%y%m%d:%H%M%S`
cp out/target/product/liberty/cyanogen_liberty-ota-eng.$USER.zip ~/Desktop/cm6-liberty-test-$etime-signed.zip
echo cm6-liberty-test-$etime-signed.zip copied to desktop
echo Build start time: $stime
echo Build end time:   $etime

#!/bin/bash  
rm -R ~/android-cm/out
rm -R ~/android-cm/vendor/htc/liberty
cd ~/android-cm/device/htc/liberty
sh copy-files.sh
cd ~/android-cm
source build/envsetup.sh
lunch cyanogen_liberty-eng
make acp
make -j4 otapackage

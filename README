README.TXT: device_htc_liberty.git
----

* Description

  This repository is for CM6 on HTC liberty.
  It is still a work in progress.  This vendor addition is originally based on cyanogen's supersonic vendor and modified accordingly.
  

    
* How To Build CM6 for HTC liberty

  Make a workspace

  $ mkdir android-cm
  $ cd android-cm


  Do repo init & sync

  $ repo init -u git://github.com/CyanogenMod/android.git -b froyo
  $ repo sync

  Setup vendor

  $ cd vendor/cyanogen/
  $ ./get-rommanager 
  $ ./get-google-files 


  Setup device

  Connect phone to usb abd make sure debugging is avaliable for adb pulls

  $ cd ../../device/htc
  $ git clone git://github.com/attn1/device_htc_liberty
  $ mv device_htc_liberty/ liberty
  $ cd liberty/
  $ ./extract-files.sh # this pulls files from working liberty with most variants of shipped HTC ROM
  $ cd ../../..


  Setup environment

  $ source build/envsetup.sh 
  $ lunch
  (select cyanogen_liberty-eng)


  Build CM6

  $ make acp
  (to avoid errors on distributed building)

  $ make -j4 otapackage


* Thanks

  Cyanogen  
  CyanogenMod team

  All XDA members, 
    especially, HTC Hero/Sapphire developers and contributors
            and member in the developer forum of HTC liberty


* History

  Wed Jul 14 2010: by attn1: first commit for Liberty port
  Wed Jul 28, 2010 by attn1: rebuild entire repo with first pre-alpha candidate


----
EOF

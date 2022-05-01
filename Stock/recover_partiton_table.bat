@ECHO OFF
ECHO "                           __                                                                    "
ECHO "|  | _| _ _  _  _  |_ _   (_ |_ _  _|  __  _  _  _|_.|_. _  _  __ |_ _ |_ | _  | _  _|_ _ || _ _ "
ECHO "|/\|(-|(_(_)|||(-  |_(_)  __)|_(_)(_|(    |_)(_|| |_||_|(_)| )    |_(_||_)|(-  || )_)|_(_|||(-|  "
ECHO "                                          |                                                      "
ECHO "                                                                                                 "
ECHO This will flash the Stock-partition-table for you.
ECHO After flashing this, you can flash Firmware images with NOST or OST LA.
timeout /t 5
cls
ECHO WARNING!
ECHO AFTER FLASHING THE PARTITION-TABLE, THE DEVICE DOESN'T BOOT!
ECHO YOU MUST FLASH A ROM WITH NOST OR OST LA AFTERWARDS IN ORDER TO USE THE DEVICE.
timeout /t 10
cls
ECHO Boot your device into fastboot, bootloader or download mode and connect it to your PC. Enter [f] when your device is in fastboot-mode and connected to your PC to proceed.
choice /c:f %1

:start
cls
ECHO Let's flash xD
timeout /t 5

cls
ECHO Flashing stock partition-table
fastboot flash partition:0 gpt_both0.bin
cls
ECHO Rebooting device into download mode. DO NOT disconnect your device!
fastboot reboot bootloader
timeout /t 5
cls
ECHO Done xD
ECHO DON'T FORGET TO FLASH A FIRMWARE WITH NOST OR OST LA.
ECHO enjoy xD
timeout /t 5

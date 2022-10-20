#!/bin/bash

echo "                           __                                                                    "
echo "|  | _| _ _  _  _  |_ _   (_ |_ _  _|  __  _  _  _|_.|_. _  _  __ |_ _ |_ | _  | _  _|_ _ || _ _ "
echo "|/\|(-|(_(_)|||(-  |_(_)  __)|_(_)(_|(    |_)(_|| |_||_|(_)| )    |_(_||_)|(-  || )_)|_(_|||(-|  "
echo "                                          |                                                      "
echo ""
echo "This will flash the Stock-partition-table for you."
echo "After flashing this, you can flash Firmware images with NOST or OST LA."
sleep 5
clear
echo "WARNING!"
echo "AFTER FLASHING THE PARTITION-TABLE, THE DEVICE DOESN'T BOOT!"
echo "YOU MUST FLASH A ROM WITH NOST OR OST LA AFTERWARDS IN ORDER TO USE THE DEVICE."
sleep 10
clear
read -N1 -p $"Boot your device into fastboot, bootloader or download mode and connect it to your PC. Enter [f] when your device is in fastboot-mode and connected to your PC to proceed." answer1
if [ "${answer1,,}" == "f" ]
then

clear
echo "Let's flash xD"
sleep 5

clear
echo "Flashing stock partition-table"
fastboot flash partition:0 gpt_both0.bin
clear
echo "Rebooting device into download mode. DO NOT disconnect your device!"
fastboot reboot bootloader
sleep 5
clear
echo "Well done xD"
echo "DON'T FORGET TO FLASH A FIRMWARE WITH NOST OR OST LA."
echo "enjoy xD"
sleep 5

fi

#END

#!/bin/bash

echo "                          ___          __      __                 __      __                          "
echo "|  | _| _ _  _  _  |_ _    |  __ \  /||__)/  \(_    _ _   _ _|_    _)    /  \    /| | _  _|_ _ || _ _ "
echo "|/\|(-|(_(_)|||(-  |_(_)   |      \/ || \ \__/__)  | (-\/(-| |_   /__.   \__/ .   | || )_)|_(_|||(-|  "
echo ""                                                                                                 
echo "This will flash the Nokia Stock ROM 5140(Android 10) on your device."
sleep 5s
clear
echo "WARNING!"
echo "MAKE A BACKUP FROM YOUR DATA!"
echo "ALL DATA WILL BE LOST AFTER FLASHING (FACTORY RESET)!"
echo "WE ACCEPT NO LIABILITY IF YOU LOSE DATA OR USE THIS TOOL INCORRECTLY!"
sleep 10s
clear

echo "WARNING!"
echo "FLASHING SOME PARTITIONS CAN TAKE SOME TIME (ABOUT 5 MINUTES)."
echo "DO NOT UNPLUG USB-CABLE OR CLOSE CMD OR YOU WILL BRICK YOUR DEVICE!!!"
echo "SOMETIMES CMD SEEMS TO BE FREZZING. DO NOT ABORT THE PROCESS AND CLICK IN THIS WINDOW TO CONTINUE."
echo "THE FLASING PROGRESS WILL CONTINUE."
sleep 10s
clear

read -N1 -p $"Are you ready to flash Stock ROM? 
Yes [y]
No [n]" answer1
if [ "${answer1,,}" == "y" ]
then
clear
read -N1 -p $"Have you read the warnings and are you sure you want to proceed?
Yes [y]
No [n]" answer2
if [ "${answer2,,}" == "y" ]
then
clear
read -N1 -p $"Boot your device into fastboot, bootloader or download mode and connect it to your PC. Enter [f] when your device is in fastboot-mode and connected to your PC to proceed." answer3
if [ "${answer3,}" == "f" ]
then
clear
echo "ATTENTION!!!"
echo "The whole flasing process can take beetween 15-20 minutes."
echo "In this time you can drink coffie/tea, goes out with your dog, playing with youself or doing something else."
sleep 10s
clear
echo "Let's flash and revert back to your old Stock ROM :)"
sleep 5s
clear
echo "Flashing Bootloader"
fastboot flash abl abl.elf
fastboot flash xbl xbl.elf
echo "Rebooting device into download mode. DO NOT disconnect your device!"
fastboot reboot bootloader
clear
echo "Flashing stock partition-table"
fastboot flash partition:0 gpt_both0.bin
clear
echo "Rebooting device into download mode. DO NOT disconnect your device!"
fastboot reboot bootloader
sleep 5s
clear
echo "Flashing Stock ROM"
fastboot flash boot_a boot.img
fastboot flash boot_b boot.img
fastboot flash box box.img
fastboot flash cda_a cda.img
fastboot flash cda_b cda.img
fastboot flash dsp_a dsp.bin
fastboot flash dsp_b dsp.bin
fastboot flash elabel elabel.img
fastboot flash hidden_a hidden.img
fastboot flash hidden_b hidden.img
fastboot flash keystore keystore.img
fastboot flash logdump logdump.img
fastboot flash misc misc.img
fastboot flash modem_a modem.bin
fastboot flash modem_b modem.bin
fastboot flash persist persist.img
fastboot flash splash2 splash2.img
fastboot flash ssd ssd.img
fastboot flash sutinfo sutinfo.img
fastboot flash system_a system.img
fastboot flash system_b system.img
fastboot flash systeminfo_a systeminfo.img
fastboot flash systeminfo_b systeminfo.img
fastboot flash vendor vendor.img
clear
echo "Well done xD"
echo "Switching to Slot A"
fastboot --set-active=a
echo "Formatting Data"
fastboot erase userdata
fastboot reboot
clear
echo You are back to Stock ROM successfully. 
echo Your device will boot into the ROM now. 
echo Enjoy your time travel to the ancient times xD

fi
fi
fi

if [ "${answer1,,}" == "n" ]
then
exit
if [ "${answer2,,}" == "n" ]
then
exit
if [ "${answer3,,}" == "n" ]
then
exit

fi
fi
fi

@ECHO OFF
ECHO "                          ___          __      __                 __      __                     "
ECHO "|  | _| _ _  _  _  |_ _    |  __ \  /||__)/  \(_    _ _   _ _|_    _)    /  \  | _  _|_ _ || _ _ "
ECHO "|/\|(-|(_(_)|||(-  |_(_)   |      \/ || \ \__/__)  | (-\/(-| |_   /__.   \__/  || )_)|_(_|||(-|  "
ECHO "                                                                                                 "
ECHO This will flash the Stock ROM and partition tables on your device.
timeout /t 5
cls
ECHO WARNING!
ECHO MAKE A BACKUP FROM YOUR DATA!
ECHO ALL DATA WILL BE LOST AFTER FLASHING (FACTORY RESET)!
ECHO WE ACCEPT NO LIABILITY IF YOU LOSE DATA OR USE THIS TOOL INCORRECTLY!
timeout /t 10
cls

:ask1
ECHO Are you ready to flash Stock ROM?
ECHO Yes [Y]
ECHO No [N]

choice /n /c:yn %1

IF ERRORLEVEL ==2 GOTO end
IF ERRORLEVEL ==1 GOTO ask2

:ask2
cls
ECHO Have you read the warnings and are you sure you want to proceed?
ECHO Yes [Y]
ECHO No [N]

choice /n /c:yn %1


IF ERRORLEVEL ==2 GOTO end
IF ERRORLEVEL ==1 GOTO ask3

:ask3
cls
ECHO Boot your device into fastboot, bootloader or download mode and connect it to your PC. Enter [f] when your device is in fastboot-mode and connected to your PC to proceed.
choice /n /c:f %1

:start
cls
ECHO Let's flash and revert back to your old Stock ROM :)
timeout /t 5
cls
ECHO Flashing stock partition-table
fastboot flash partition:0 gpt_both0.bin
cls
ECHO Rebooting device into download mode. DO NOT disconnect your device!
fastboot reboot bootloader
timeout /t 5
cls
ECHO Flashing Stock ROM
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
fastboot flash keystore keystore.bin
fastboot flash logdump logdump.bin
fastboot flash misc misc.bin
fastboot flash modem_a modem.img
fastboot flash modem_b modem.img
fastboot flash persist persist.bin
fastboot flash splash2 splash2.bin
fastboot flash ssd ssd.bin
fastboot flash sutinfo sutinfo.img
fastboot flash system_a system.img
fastboot flash system_b system.img
fastboot flash systeminfo_a systeminfo.img
fastboot flash systeminfo_b systeminfo.img
cls
ECHO Done xD
ECHO Switching to Slot A
fastboot --set-active=a
ECHO Formatting data
fastboot erase userdata
fastboot reboot
cls
ECHO You are back to Stock ROM successfully. 
ECHO Your device will boot into the ROM now. 
ECHO Enjoy your time travel to the ancient times xD

:end
exit

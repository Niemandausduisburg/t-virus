@echo OFF
:init
cls
ECHO "                          ___          __      __                    "
ECHO "|  | _| _ _  _  _  |_ _    |  __ \  /||__)/  \(_   . _  _|_ _ || _ _ "
ECHO "|/\|(-|(_(_)|||(-  |_(_)   |      \/ || \ \__/__)  || )_)|_(_|||(-|  "
ECHO "                                                                     "
ECHO Which option do you need?
ECHO - Flash T-VIRUS [1]
ECHO - Flash Stock ROM [2]
ECHO or
ECHO - Restore Stock-partition-table [3]
choice /n /c:123 %1
if ERRORLEVEL ==1 goto TVIRUS
if ERRORLEVEL ==2 goto STOCK
if ERRORLEVEL ==3 goto RESTORE
:TVIRUS
cls
cd T-Virus_5GB
call "%cd%/flash_T-Virus_5GB.bat"
:STOCK
cls
cd Stock
call "%cd%/flash_T-Virus_revert.bat"
:RESTORE
cd Stock
call "%cd%/recover_partiton_table.bat"
:end
cls
exit

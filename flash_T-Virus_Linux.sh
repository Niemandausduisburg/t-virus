echo "                          ___          __      __                    "
echo "|  | _| _ _  _  _  |_ _    |  __ \  /||__)/  \(_   . _  _|_ _ || _ _ "
echo "|/\|(-|(_(_)|||(-  |_(_)   |      \/ || \ \__/__)  || )_)|_(_|||(-|  "
echo ""                                                
read -N1 -p $"Which option do you need?
- Flash T-VIRUS for flashing custom ROMs [1]
- Revert to stock ROM [2]
or
- Restore Stock-partition-table for using NOST [3]" answer1
if [ "${answer1,,}" == "1" ]
then
clear
cd T-Virus_5GB/
./flash_T-Virus_5GB.sh
fi

if [ "${answer1,,}" == "2" ]
then
clear
cd Stock
./flash_T-Virus_revert.sh
fi

if [ "${answer1,,}" == "3" ]
then
clear
cd Stock
./recover_partition_table.sh
fi

#!/bin/bash
_zenity="/usr/bin/zenity"

clear
 menu="                Movies_Now HD

 1. Remove TP list & Preserve.conf
 2. Splitnzip CIRD_Patchware & XFer Patchware
 3. Splitnzip DIRD_Patchware & XFer Patchware
 4. Splitnzip Factoryware & XFer factoryware
 5. Splitnzip Appware & XFer Appware
 6. Splicing 
 7. Assign Group ID,Member,Reboot
 8. Group Reset & Verify
 9. Cleanup 
 10.Synchronize
 11.Universal Reboot
 12.Exit "


  while true
   do 
    printf "%s\n: " "$menu"
     read choice
echo " You selected $choice";
    case $choice in



"1")printf "\n";
zenity --question \
--text="Are you sure you want to delete Tplist and Preserve.conf?"
	if [ $? -eq 0 ];
	then
	printf "\n";
	echo "Removing <<< Tplist.cfg ";
	./remote-exec.sh -g uni-ver-sal -d +S20 rm /root/configs/tplist.cfg
	sleep 2
	printf "\n";
	echo "Removing <<< Preserve.conf";
	./remote-exec.sh -g uni-ver-sal -d +S20 rm /root/configs/preserve.conf 
	sleep 2 
	printf "\n";
	echo "It's Done !!!";
	sleep 10
        clear

else
       clear
       continue
	fi
	;;



"2") printf "\n";
zenity --question \
--text="Are you sure you want to Transfer Patchware_CIRD?"
 if [ $? -eq 0 ];   
then
    printf "\n";
	echo "Patchware_CIRD SplitNZip is Done";
	splitnzip.sh -s 150000 -d /mnt/support/package/ /home/amagi/operations/Firmware/Movies_Now/MO_HD/patchware_CIRD.zip
	printf "\n";
	sleep 10
	printf "\n";
	echo "Patchware_CIRD Transfered Successfully";
	./xfer-file.sh -g uni-ver-sal -d +S200 -c 2 /home/amagi/operations/Firmware/Movies_Now/MO_HD/patchware_CIRD.zip
	printf "\n";
	echo "It's Done !!!";
	sleep 10
clear

else
clear
   continue
fi
;;


"3") printf "\n";
zenity --question \
--text="Are you sure you want to Transfer Patchware_DIRD?"
 if [ $? -eq 0 ];   
then
printf "\n";
echo "Patchware_DIRD SplitNZip is Done";
splitnzip.sh -s 150000 -d /mnt/support/package/ /home/amagi/operations/Firmware/Movies_Now/MO_HD/patchware_DIRD.zip
printf "\n";
sleep 10
printf "\n";
echo "Patchware_DIRD Transfered Successfully";
./xfer-file.sh -g uni-ver-sal -d +S200 -c 2 /home/amagi/operations/Firmware/Movies_Now/MO_HD/patchware_DIRD.zip
printf "\n";
echo "It's Done !!!";
sleep 10
clear

else
clear
continue
fi
;;

"4") printf "\n";
zenity --question \
--text="Are you sure you want to Transfer Factoryware?"
 if [ $? -eq 0 ];   
then
printf "\n";
echo "Factoryware_3.36.3 SplitNZip is Done";
splitnzip.sh -s 150000 -d /mnt/support/package/ /home/amagi/operations/Firmware/Movies_Now/MO_HD/factoryware_3.36.3.zip
printf "\n";
sleep 10
printf "\n";
echo "Factoryware_3.36.3.zip is being Transferring!!!";
./xfer-file.sh -g uni-ver-sal -d +S1200 -c 3 /home/amagi/operations/Firmware/Movies_Now/MO_HD/factoryware_3.36.3.zip # >  /home/amagi/Session.txt 2>&1

printf "\n";


sleep 320 & PID=$! #simulate a long process

echo "THIS MAY TAKE A WHILE, PLEASE BE PATIENT UPGRADING FIRMWARE..."
printf "["
# While process is running...
while kill -0 $PID 2> /dev/null; do 
   printf  "."
  sleep 1
done
printf "] done!"
sleep 10
clear

else
clear
continue
fi
;;


#sleep 5
#echo "Do you want to continue press Y  OR To Cancel Session press N"
#read choice
#if [ $choice == "y" -o $choice == "Y" ]; then
#continue
#else
#if [ $choice == "n" -o $choice == "N" ]; then
#input=/home/amagi/Session.txt
#./cancel-session.sh -s $input
#fi
#fi
#if [ $input == "n" -o $input == "n" ]; then
#clear
#continue
#fi
#;;



"5") printf "\n";
zenity --question \
--text="Are you sure you want to Transfer Appware?"
 if [ $? -eq 0 ];   
then
printf "\n";
echo "Appware_3.36.3 SplitNZip is Done";
splitnzip.sh -s 150000 -d /mnt/support/package/ /home/amagi/operations/Firmware/Movies_Now/MO_HD/appware_3.36.3.zip
printf "\n";
sleep 10
printf "\n";
echo "Appware_3.36.3.zip is being Transferring";
./xfer-file.sh -g uni-ver-sal -d +S1200 -c 3 /home/amagi/operations/Firmware/Movies_Now/MO_HD/appware_3.36.3.zip
#printf "\n";

sleep 230 & PID=$! #simulate a long process
printf "\n";
echo "THIS MAY TAKE A WHILE, PLEASE BE PATIENT WHILE UPGRADING FIRMWARE..."
printf "["
# While process is running...
while kill -0 $PID 2> /dev/null; do 
    printf  "."
    sleep 1
done
printf "] done!"
sleep 10
clear 
 
else
clear
continue
fi
;;


"6") printf "\n";
zenity --question \
--text="Are you sure you want to Transfer Signature?"
 if [ $? -eq 0 ];   
then
printf "\n";
	echo "Signature SplitNZip is Done";
	splitnzip.sh -s 150000 -d /mnt/ops/uploads/ /home/amagi/operations/03-Signature/signature_ALLIN_01_015DM.zip
sleep 10
printf "\n";
echo "Signature is being Transferring!!!";
./xfer-file.sh -g uni-ver-sal -d +S180 -c 3 /home/amagi/operations/03-Signature/signature_ALLIN_01_015DM.zip
printf "\n";
sleep 120
else
clear

printf "\n"
#clear
#else
#clear
continue
fi


zenity --question \
--text="Are you sure you want to Transfer Adfiles?"
 if [ $? -eq 0 ];   
then
printf "\n";
echo "Adfile SplitNZip is Done";
splitnzip.sh -s 150000 -d /mnt/ops/uploads/ /home/amagi/operations/04-Adfile/AIM115DM.zip
sleep 10
printf "\n";
echo "Adfile is being Transferring!!!";
./xfer-file.sh -g uni-ver-sal -d +S200 -c 2 /home/amagi/operations/04-Adfile/AIM115DM.zip
printf "\n";
sleep 120

else
clear 
continue
fi
printf "\n";

zenity --question \
--text="Are you sure you want to Transfer Playlist?"
 if [ $? -eq 0 ];   
then
printf "\n";
echo "Playlist SplitNZip is Done";
splitnzip.sh -s 150000 -d /mnt/ops/uploads/ /home/amagi/operations/02-Playlists/Archive/Playlist_20160525_DM_BA_001.zip
sleep 10
printf "\n";
echo "Playlist is being Transferring!!!";
./xfer-file.sh -g uni-ver-sal -d +S200 -c 2 /home/amagi/operations/02-Playlists/Archive/Playlist_20160525_DM_BA_001.zip
printf "\n";
sleep 5
clear
printf "\n"
else
clear
continue
fi
;;

"7")

zenity --question \
--text="Are you sure you want to Assign Group ID?"
 if [ $? -eq 0 ];   
then
printf "\n";
n=`cat /home/amagi/UUIDFile.txt`                                                       
for i in $n
do
./group-mgnt.sh -o assign-box-id -U $i -D PROD_1001 -d +S100 -c 1
#echo $i
done
printf "\n";
echo "Group ID(1001) Assigned successefully !!!";
sleep 2
printf "\n";
echo "Kindly wait for 25 Sec to Auto assign Group Member(10001)!!!! ";
sleep 25
printf "\n";
./group-mgnt.sh -o add-member-id -S PROD_1001 -D PROD_G_10001 -d +S100 -c 1
sleep 2
printf "\n";
echo " Adding Member(10001)!!! Wait for 50 Sec..And group reboot starts";
sleep 50
./remote-exec.sh -g PROD_G_10001 -d +S20 reboot
sleep 2
printf "\n";
echo "Board is going to Reboot... !!! ";
sleep 10
clear

else
printf "\n"
clear
continue
fi
;;


"8")zenity --question \
--text="Are you sure you want to Reset Group ID?"
 if [ $? -eq 0 ];   
then
printf "\n";
n=`cat /home/amagi/UUIDFile.txt`
for i in $n
do
./group-mgnt.sh -o reset-box-id -U $i -d +S100 -c 1
done
printf "\n";
echo "Resetting Group ID's to default.. Kindly wait for 10 sec to confirm !!!";
sleep 10
./remote-exec.sh -g PROD_G_10001 -d +S20 reboot
sleep 15
printf "\n";
 echo "Group ID(10001) is not present and I>>Won't>>Reboot !!!";
sleep 10 
clear

else
printf "\n"
clear
continue
fi
;;



     
"9") 

zenity --question \
--text="Are you sure you want to Cleanup Entire contents in /mnt/ops Directory?"
 if [ $? -eq 0 ];  
then
printf "\n"; 
echo "Removing <<<<< Signatures,Avfiles & Playlists contents!!!!";
        ./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/signatures/*.dat
	./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/avfiles/*.ts
         ./remote-exec.sh -g uni-ver-sal -d +S20 rm /mnt/ops/playlists/*.SCH
	./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/playlists/*.txt

sleep 10
printf "\n";
echo "Removing <<<<< Logs contents!!!!";
	./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/logs/*.VER
	./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/logs/*.SCH
	./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/logs/*.log
	./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/logs/*.VER
	./remote-exec.sh -g uni-ver-sal -d +S100 rm /mnt/ops/logs/*.SCH


 
sleep 60
printf "\n";
echo "Removing <<<<<< Replayevents & Run_Time_Data!!!!";

         ./remote-exec.sh -g uni-ver-sal -d +S100 rm /root/replayevents.txt
         ./remote-exec.sh -g uni-ver-sal -d +S100 -- rm -rf /mnt/ops/dartbus/run_time_data


	 sleep 90
printf "\n";
echo "Removing <<<< Mbxdb & Chlist!!!!";
         ./remote-exec.sh -g uni-ver-sal -d +S20 rm /mnt/home/mbxdb.dat
	./remote-exec.sh -g uni-ver-sal -d +S20 rm /root/configs/chlist.cfg

printf "\n";
sleep 30
echo " ------>>>>>>>>>Completed All Cleanup Process<<<<<<<------ !!! ";
printf "\n"
sleep 10
clear


else
clear
continue
fi
;;


"10")
sleep 5 
echo " Successefully Synced !!!";
sleep 2
./remote-exec.sh -g uni-ver-sal -d +S20 sync
sleep 5
printf "\n"
clear
;;

"11") 
sleep 10
echo "successefully Rebooted!! To ensure go & watch TV that all boards are rebooted "; 
sleep 2
./remote-exec.sh -g uni-ver-sal -d +S20 reboot
sleep 5
printf "\n"
clear
;;

"12") 
#sleep 2
printf "\n";
echo ">>>>OK BYE BYE<<<<<";
clear
exit
./Main.sh
exit

esac
done


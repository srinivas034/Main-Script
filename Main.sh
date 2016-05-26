#!/bin/bash
#set -n 
clear
echo "        ----------------------"
echo "          SELECT YOUR CHOICE";
echo "        ----------------------"

menu="           
 1. Zee_Tv,Zee_Cinema,Zee_Bangla,Zee_Marathi
 2. Zee_News
 3. Movies_Now SD
 4. Movies_Now HD
 5. Colors_National
 6. Exit"
while true
   do 
    printf "%s\n: " "$menu"
     read choice
echo " You selected $choice";
    case $choice in

"1")
./playlist_change.sh
./Zee.sh 
;;

"2")
./playlist_change.sh
./Zee_News.sh
;;

"3")
./playlist_change.sh
./Mo_SD.sh
;;

"4")
./playlist_change.sh
./Mo_HD.sh
;;

"5")
./playlist_change.sh
./Colors_National.sh
;;


"6")
echo "<<<< Bye Bye!!! >>>>";
exit 
clear
;;
esac
done




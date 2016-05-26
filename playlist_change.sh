#!/bin/bash
a=`date +'%F' -d "$d" | sed -e 's/-//g'`
#echo -e $a 
sed -i "s/\(Playlist_\).*\(.zip\)/\1"$a"_DM_BA_001\2/g" Zee.sh Zee_News.sh Mo_SD.sh Mo_HD.sh Colors_National.sh



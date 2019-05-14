#!/usr/bin/expect

# make sure Expect scripting language works
# otherwise :
# apt-get install expect
# make sure you have in the same folder the set-up settings.sh (provided to you in person)
# modify the path where you want to store the new data within settings.sh
# execute the present scipt in terminal :  ./CCMP.upload_need_psw.sh
# it will start recursif data download (ALL files)

source settings.sh


## connect to ftp
spawn ftp
expect "ftp>" {send "open eclipse.ncdc.noaa.gov \r"}
sleep 1
expect *
sleep 1
send $USER\r
sleep 2
expect *
send $PASSWD\r
sleep 1
send "bin\r"
send "prompt\r"
send "cd /pub/seawinds/SI/uv/6hrly/netcdf/1980s/\r"
# send "ls\r"
expect "ftp>" {send "lcd $DATA_PATH\n"}
send "mget -c -nH -nd -np -A .nc \r"
expect "ftp>" {send "quit\r"}
expect eof
interact


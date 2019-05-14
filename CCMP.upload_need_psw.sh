#!/usr/bin/expect

# execute it as:  ./CCMP.upload.exp
# téléchargement récursif (ALL)
# CCMP_NOAA
# see documentation:  /READ/satellite_ocean_winds.doc
# https://www.ncdc.noaa.gov/data-access/marineocean-data/blended-global/blended-sea-winds

# log_user 0

# set timeout -1 # Start COMMAND, and kill it if still running after DURATION.
source file1.sh

#if {[llength $argv] == 0} {
#  eof { send_user "\n $DATA_PATH $HOST $USER $PASSWD\n" }
#}

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




# Name (eclipse.ncdc.noaa.gov:emaksimovich): anonymous
# 331 Anonymous login ok, send your complete email address as your password
# Password:
# 230 Anonymous access granted, restrictions apply
# Remote system type is UNIX.
# Using binary mode to transfer files.

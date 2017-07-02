#!/bin/bash
l_date=$(date +%y%b%d)

# get backup type
echo "What would you like to update? (type 'types' to get the types)"
read backupType
echo ""

# get location backups go
source ./backupsLocation.cfg

if [ "$backupType" = "types" ]
then
    echo "Full backup - 'full'"
    echo "All media devices - 'media'"
    echo "Home directory - 'home'"
    echo "Custom directory - 'custom'"
fi

if [ "$backupType" = "full" ]
then
    tar -cvf "$location"/${l_date}_full-backup.tar /
fi

if [ "$backupType" = "media" ]
then
    tar -cvf "$location"/${l_date}_media-backup.tar /media/
fi

if [ "$backupType" = "home" ]
then
    tar -cvf "$location"/${l_date}_home-backup.tar /home/
fi

if [ "$backupType" = "custom" ]
then
    echo "What file would you like to back up?"
    read backupDir
    tar -cvf "$location"/${l_date}_custom-backup.tar "$backupDir"
fi

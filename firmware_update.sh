#!/bin/bash
#Author : VXL Software
#A Firmware Update Script

log_path="/newroot/var/log/firmware.log"
delete_pkg_path="/sda1/data/firmware_update/delete-pkg/"
add_pkg_path="/sda1/data/firmware_update/add-pkg/"
delete_content_path="/sda1/data/firmware_update/delete-contents/"
add_content_path="/sda1/data/firmware_update/add-contents/"

RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"



echo "=========================================================" >> "$log_path"
echo -e "${GREEN} Firmware-Update [ START : `date` ] ${END}" >> "$log_path"
echo "=========================================================" >> "$log_path"


#Check for Delete Package
if [ -d "$delete_pkg_path" ]
then

	/scripts/deletepkg.sh
fi

#Check for Add Package
if [ -d "$add_pkg_path" ]
then

	/scripts/addpkg.sh
fi

#Check for Delete Package Content
if [ -d "$delete_content_path" ]
then

	/scripts/deletecontents.sh
fi

#Check for Add Package Contents
if [ -d "$add_content_path" ]
then

	/scripts/addcontents.sh
fi

cd /
rm -rf /sda1/data/firmware_update
echo "=========================================================" >> "$log_path"
echo -e "${GREEN} Firmware-Update [ ENDS : `date` ] ${END}" >> "$log_path"
echo "=========================================================" >> "$log_path"

exit 0

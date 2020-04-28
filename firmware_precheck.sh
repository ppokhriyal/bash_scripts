#!/bin/bash
#Author : VXL Software
#Firmware Pre-Check is a sanity check of firmware update validity

#Structure
#=========
#/sda1/data/firmware_update/add-pkg
#/sda1/data/firmware_update/delete-pkg
#/sda1/data/firmware_update/add-content
#/sda1/data/firmware_update/delete-content

#Firmware Log Path
LOG_PATH="/var/log/firmware.log"
RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"

#Get Firmware Name
FIRMWARE=`echo $1 | awk -F'.' '{print $1}'`

#Start Logging
echo "================================================================" >> $LOG_PATH
echo "$FIRMWARE : `date`" >> $LOG_PATH
echo " " >> $LOG_PATH


#Check if Package to be Deleted is available
if [ -d "/sda1/data/firmware_update/delete-pkg/" ]
then
	cd /sda1/data/firmware_update/delete-pkg

	#Loop through all the packages
	for i in `ls`
	do
		prefix=`echo $i |awk -F':' '{print $1}'`
		pkgname=`echo $i | awk -F':' '{print $2}'`

		case $prefix in

			apps)
					
				if [ ! -f "/sda1/data/apps/$pkgname" ]
				then
					 echo -e "[ ${RED} PRE-CHEK : Failed ${END} ] $pkgname is not available for updation " >> $LOG_PATH
					 echo "================================================================" >> $LOG_PATH
					 python /root/firmware_msg.py "Error : INVALID PATCH "
					 exit 0
				fi
				;;

			basic)
				
				if [ ! -f "/sda1/data/basic/$pkgname" ]
				then
					echo -e "[ ${RED} PRE-CHEK : Failed ${END} ] $pkgname is not available for updation " >> $LOG_PATH
					echo "================================================================" >> $LOG_PATH
					python /root/firmware/firmware_msg.py "Error : INVALID PATCH"
					exit 0
					
				fi
				;;

		esac

	done
fi

#Check if Package available for Adding contents
if [ -d /sda1/data/firmware_update/add-contents ]
then
	cd /sda1/data/firmware_update/add-contents/

	for i in `ls`
	do
		prefix=`echo $i |awk -F':' '{print $1}'`
		pkgname=`echo $i | awk -F':' '{print $2}'`

		case $prefix in

			apps)
				
				if [ ! -f "/sda1/data/apps/$pkgname" ]
				then
					echo -e "[ ${RED} PRE-CHEK : Failed ${END} ] $pkgname is not available for updation" >> $LOG_PATH
					echo "================================================================" >> $LOG_PATH
					python /root/firmware/firmware_msg.py "Error : INVALID PATCH"
					exit 0
				fi
				;;

			basic)

				if [ ! -f "/sda1/data/basic/$pkgname" ]
				then
					echo -e "[ ${RED} PRE-CHEK : Failed ${END} ] $pkgname is not available for updation" >> $LOG_PATH
					echo "================================================================" >> $LOG_PATH
					python /root/firmware/firmware_msg.py "Error : INVALID PATCH"
					exit 0
				fi
				;;
		esac
	done
fi

#Check if Package available for Deleting Contents
if [ -d /sda1/data/firmware_update/delete-contents ]
then
	cd /sda1/data/firmware_update/delete-contents/

	for i in `ls`
	do
		prefix=`echo $i |awk -F':' '{print $1}'`
		pkgname=`echo $i | awk -F':' '{print $2}'`

		case $prefix in

			apps)
				
				if [ ! -f "/sda1/data/apps/$pkgname" ]
				then
					echo -e "[ ${RED} PRE-CHEK : Failed ${END} ] $pkgname is not available for updation" >> $LOG_PATH
					echo "================================================================" >> $LOG_PATH
					python /root/firmware/firmware_msg.py "Error : INVALID PATCH"
					exit 0
				fi
				;;

			basic)

				if [ ! -f "/sda1/data/basic/$pkgname" ]
				then
					echo -e "[ ${RED} PRE-CHEK : Failed ${END} ] $pkgname is not available for updation" >> $LOG_PATH
					echo "================================================================" >> $LOG_PATH
					python /root/firmware/firmware_msg.py "Error : INVALID PATCH"
					exit 0
				fi
				;;
		esac
	done
fi
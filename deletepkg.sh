#!/bin/bash
#Author : VXL Software
#A wrapper script for Firmware Update [Delete Packages]

firmware_path="/sda1/data/firmware_update/"
delete_pkg_path="/sda1/data/firmware_update/delete-pkg/"
log_path="/newroot/var/log/firmware.log"
RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"

#Start
cd "$delete_pkg_path"
echo -e "[ ${GREEN} Deleting Packages Start : `date` ${END} ]" >> $log_path

for i in `ls`:
do
	prefix=`echo $i | awk -F":" '{print $1}'`
	pkgname=`echo $i | awk -F":" '{print $2}'`

	case $prefix in

		apps )
			#Check wild card is used or not
			wild=`echo "${pkgname: -1}"`

			if [ "$wild" == "*" ]
			then
				rm -rf /sda1/data/apps/$pkgname
				echo -e "[ Deleting Apps Package : $pkgname ] " >> "$log_path"
				sleep 2
				sync
			else
				rm -rf /sda1/data/apps/$pkgname
				rm -rf /newroot/data/apps-mount/`basename $pkgname .sq`
				echo -e "[ Deleting Apps Package : $pkgname ] " >> "$log_path"
				sleep 2
				sync
			fi
			;;

		basic )
			
			#Check wild card is used or not
			wild=`echo "${pkgname: -1}"`

			if [ "$wild" == "*" ]
			then
				rm -rf /sda1/data/basic/$pkgname
				echo -e "[ Deleting Baic Package : $pkgname ] " >> "$log_path"
				sleep 2
				sync
			else
				rm -rf /sda1/data/basic/$pkgname
				rm -rf /newroot/data/basic-mount/`basename $pkgname .sq`
				echo -e "[ Deleting Baic Package : $pkgname ] " >> "$log_path"
				sleep 2
				sync
			fi
			;;

		core )
			
			#Check wild card is used or not
			wild=`echo "${pkgname: -1}"`

			if [ "$wild" == "*" ]
			then
					rm -rf /sda1/data/core/$pkgname
					echo -e "[ Deleting Core Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			else
					rm -rf /sda1/data/core/$pkgname
					echo -e "[ Deleting Core Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			fi
			;;

		root )
			
			#Check wild card is used or not
			wild=`echo "${pkgname: -1}"`

			if [ "$wild" == "*" ]
			then
					rm -rf /newroot/root/$pkgname
					echo -e "[ Deleting Root Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			else
					rm -rf /newroot/root/$pkgname
					echo -e "[ Deleting Root Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			fi
			;;

		data )
			
			#Check wild card is used or not
			wild=`echo "${pkgname: -1}"`
			
			if [ "$wild" == "*" ]
			then
					rm -rf /newroot/data/$pkgname
					echo -e "[ Deleting Data Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			else
					rm -rf /newroot/data/$pkgname
					echo -e "[ Deleting Data Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			fi
			;;

		boot )
			
			#Check wild card is used or not
			wild=`echo "${pkgname: -1}"`
			
			if [ "$wild" == "*" ]
			then
					rm -rf /sda1/boot/$pkgname
					echo -e "[ Deleting Boot Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			else
					rm -rf /sda1/boot/$pkgname
					echo -e "[ Deleting Boot Package : $pkgname ]" >> "$log_path"
					sleep 2
					sync
			fi
			;;
	esac
done
cd /
rm -rf /sda1/data/firmware_update/delete-pkg
echo -e "[ ${GREEN} Deleting Packages Ends : `date` ${END} ]" >> $log_path
#END

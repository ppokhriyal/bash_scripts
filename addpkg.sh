#!/bin/bash
#Author : VXL Software
#A wrapper script for Firmware Update [Add Packages]

firmware_path="/sda1/data/firmware_update/"
add_pkg_path="/sda1/data/firmware_update/add-pkg/"
log_path="/newroot/var/log/firmware.log"
RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"

#Start
cd "$add_pkg_path"
echo -e "[ ${GREEN} Adding Packages Start : `date` ${END} ]" >> $log_path

for i in `ls`
do
	prefix=`echo $i | awk -F":" '{print $1}'`
	pkgname=`echo $i | awk -F":" '{print $2}'`

	case $prefix in

		apps )
			
			mv "${add_pkg_path}${pkgname}" /sda1/data/apps/"$pkgname"
			chmod 755 /sda1/data/apps/*.sq
			echo -e "[ Adding Apps Package : $pkgname ] " >> "$log_path"
			sleep 2
			sync
			;;

		basic )
			
			mv "${add_pkg_path}${pkgname}" /sda1/data/basic/"$pkgname"
			chmod 755 /sda1/data/basic/*.sq
			echo -e "[ Adding Baic Package : $pkgname ]" >> "$log_path"
			sleep 2
			sync
			;;

		core )
			
			mv "${add_pkg_path}${pkgname}" /sda1/data/core/"$pkgname"
			chmod 755 /sda1/data/core/*.sq
			echo -e "[ Adding Core Package : $pkgname ]" >> "$log_path"
			sleep 2
			sync
			;;

		root )
			
			mv "${add_pkg_path}${pkgname}"	/newroot/root/"$pkgname"
			chmod 755 /newroot/root/"$pkgname"
			echo -e "[ Adding Root Package : $pkgname ]" >> "$log_path"
			sleep 2
			sync
			;;

		data )
			
			mv "${add_pkg_path}${pkgname}" /newroot/data/"$pkgname"
			chmod 755 /newroot/data/"$pkgname"
			echo -e "[ Adding Data Package : $pkgname ]" >> "$log_path"
			sleep 2
			sync
			;;

		boot )
			
			mv "${add_pkg_path}${pkgname}" /sda1/boot/"$pkgname"
			chmod 755 /sda1/boot/"$pkgname"
			echo -e "[ Adding Boot Package : $pkgname ]" >> "$log_path"
			sleep 2
			sync
			;;
	esac
done
cd /
rm -rf /sda1/data/firmware_update/add-pkg
echo -e "[ ${GREEN} Adding Packages Ends : `date` ${END} ]" >> $log_path
#END

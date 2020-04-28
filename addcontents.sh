#!/bin/bash
#Author : VXL Software
#A wrapper script for Firmware Update [ Add Package Contents ]

firmware_path="/sda1/data/firmware_update/"
addpkg_content_path="/sda1/data/firmware_update/add-contents/"
log_path="/newroot/var/log/firmware.log"
RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"


#Start
cd "$addpkg_content_path"
mkdir /tmp/add_temp

echo -e "[ ${GREEN} Adding Packages Contents : `date` ${END} ]" >> $log_path

for i in `ls`
do
	prefix=`echo $i | awk -F":" '{print $1}'`
	pkgname=`echo $i | awk -F":" '{print $2}'`

	case $prefix in
		apps )
			
			cd /tmp/add_temp	
			mv /sda1/date/apps/"$pkgname" /tmp/add_temp/
			mv "$addpkg_content_path$i" /tmp/add_temp/
			unsquashfs "$pkgname"
			sleep 2
			sync
			rm -rf $pkgname
			tar xpf $i -C squashfs-root
			rm -rf $i
			mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
			sleep 2
			sync
			rm -rf squashfs-root
			mv "$pkgname" /sda1/data/apps/
			chmod 755 /sda1/data/apps/*
			cd /tmp
			rm -rf /tmp/add_temp/*
			;;

		basic )

			cd /tmp/add_temp	
			mv /sda1/date/basic/"$pkgname" /tmp/add_temp/
			mv "$addpkg_content_path$i" /tmp/add_temp/
			unsquashfs "$pkgname"
			sleep 2
			sync
			rm -rf $pkgname
			tar xpf $i -C squashfs-root
			rm -rf $i
			mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
			sleep 2
			sync
			rm -rf squashfs-root
			mv "$pkgname" /sda1/data/basic/
			chmod 755 /sda1/data/basic/*
			cd /tmp
			rm -rf /tmp/add_temp/*
			;;

		core )
		
			cd /tmp/add_temp	
			mv /sda1/date/core/"$pkgname" /tmp/add_temp/
			mv "$addpkg_content_path$i" /tmp/add_temp/
			unsquashfs "$pkgname"
			sleep 2
			sync
			rm -rf $pkgname
			tar xpf $i -C squashfs-root
			rm -rf $i
			mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
			sleep 2
			sync
			rm -rf squashfs-root
			mv "$pkgname" /sda1/data/core/
			chmod 755 /sda1/data/core/*
			cd /tmp
			rm -rf /tmp/add_temp/*
			;;	
	esac
done
cd /
rm -rf /sda1/data/firmware_update/add-contents
echo -e "[ ${GREEN} Adding Packages Contents Ends : `date` ${END} ]" >> $log_path
#END
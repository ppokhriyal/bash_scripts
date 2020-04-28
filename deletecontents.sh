#!/bin/bash
#Author : VXL Software
#A wrapper script for Firmware Update [ Deleting Package Contents ]

firmware_path="/sda1/data/firmware_update/"
deletepkg_content_path="/sda1/data/firmware_update/delete-contents/"
addpkg_content_path="/sda1/data/firmware_update/add-contents/"
log_path="/newroot/var/log/firmware.log"
RED="\e[31m"
GREEN="\e[32m"
END="\e[0m"


#Start
cd "$deletepkg_content_path"
mkdir /tmp/delete_temp

echo -e "[ ${GREEN} Deleting Packages Contents : `date` ${END} ]" >> $log_path

for i in `ls`
do
	prefix=`echo $i | awk -F":" '{print $1}'`
	pkgname=`echo $i | awk -F":" '{print $2}'`

	case $prefix in
		apps )
			#Check if Delete content require Add content also
			if [ -f "$addpkg_content_path$pkgname" ]
			then
					cd /tmp/delete_temp
					mv /sda1/date/apps/"$pkgname" /tmp/delete_temp/
					mv "$deletepkg_content_path$i" /tmp/delete_temp/
					unsquashfs "$pkgname"
					sleep 2
					sync
					rm -rf "$pkgname"
					#Deleting the contents
					while read lines
					do
						rm -rf squashfs-root"$lines"

					done < "$i"

					rm -rf $i

					#Adding the contents
					mv "$addpkg_content_path$i" /tmp/delete_temp/
					tar xpf "$i" -C squashfs-root
					mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
					sleep 2
					sync
					rm -rf squashfs-root
					rm -rf "$i"
					mv "$pkgname" /sda1/data/apps/
					chmod 755 /sda1/data/apps/*
					cd /
					rm -rf /tmp/delete_temp/*

			else
				#Deleting the Package contents
				cd /tmp/delete_temp
				mv /sda1/data/apps/"$pkgname" /tmp/delete_temp/
				mv "$deletepkg_content_path$i" /tmp/delete_temp/
				unsquashfs "$pkgname"
				sleep 2
				sync
				rm -rf "$pkgname"
				while read lines
				do
					rm -rf squashfs-root"$lines"
				done < "$i"
				rm -rf $i
				mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
				sleep 2
				sync
				rm -rf squashfs-root
				mv "$pkgname" /sda1/data/apps/
				chmod 755 /sda1/data/apps/*
				cd /
				rm -rf /tmp/delete_temp/*
			fi
			;;

		basic )

			#Check if Delete content require Add content also
			if [ -f "$addpkg_content_path$pkgname" ]
			then
					cd /tmp/delete_temp
					mv /sda1/date/basic/"$pkgname" /tmp/delete_temp/
					mv "$deletepkg_content_path$i" /tmp/delete_temp/
					unsquashfs "$pkgname"
					sleep 2
					sync
					rm -rf "$pkgname"
					#Deleting the contents
					while read lines
					do
						rm -rf squashfs-root"$lines"

					done < "$i"

					rm -rf $i

					#Adding the contents
					mv "$addpkg_content_path$i" /tmp/delete_temp/
					tar xpf "$i" -C squashfs-root
					mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
					sleep 2
					sync
					rm -rf squashfs-root
					rm -rf "$i"
					mv "$pkgname" /sda1/data/basic/
					chmod 755 /sda1/data/basic/*
					cd /
					rm -rf /tmp/delete_temp/*

			else
				#Deleting the Package contents
				cd /tmp/delete_temp
				mv /sda1/data/apps/"$pkgname" /tmp/delete_temp/
				mv "$deletepkg_content_path$i" /tmp/delete_temp/
				unsquashfs "$pkgname"
				sleep 2
				sync
				rm -rf "$pkgname"
				while read lines
				do
					rm -rf squashfs-root"$lines"
				done < "$i"
				rm -rf $i
				mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
				sleep 2
				sync
				rm -rf squashfs-root
				mv "$pkgname" /sda1/data/apps/
				chmod 755 /sda1/data/apps/*
				cd /
				rm -rf /tmp/delete_temp/*
			fi
			;;

		core )

			#Check if Delete content require Add content also
			if [ -f "$addpkg_content_path$pkgname" ]
			then
					cd /tmp/delete_temp
					mv /sda1/date/core/"$pkgname" /tmp/delete_temp/
					mv "$deletepkg_content_path$i" /tmp/delete_temp/
					unsquashfs "$pkgname"
					sleep 2
					sync
					rm -rf "$pkgname"
					#Deleting the contents
					while read lines
					do
						rm -rf squashfs-root"$lines"

					done < "$i"

					rm -rf $i

					#Adding the contents
					mv "$addpkg_content_path$i" /tmp/delete_temp/
					tar xpf "$i" -C squashfs-root
					mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
					sleep 2
					sync
					rm -rf squashfs-root
					rm -rf "$i"
					mv "$pkgname" /sda1/data/core/
					chmod 755 /sda1/data/core/*
					cd /
					rm -rf /tmp/delete_temp/*

			else
				#Deleting the Package contents
				cd /tmp/delete_temp
				mv /sda1/data/apps/"$pkgname" /tmp/delete_temp/
				mv "$deletepkg_content_path$i" /tmp/delete_temp/
				unsquashfs "$pkgname"
				sleep 2
				sync
				rm -rf "$pkgname"
				while read lines
				do
					rm -rf squashfs-root"$lines"
				done < "$i"
				rm -rf $i
				mksquashfs squashfs-root "$pkg_name" -b 1M -comp xz -Xdict-size 100%
				sleep 2
				sync
				rm -rf squashfs-root
				mv "$pkgname" /sda1/data/core/
				chmod 755 /sda1/data/core/*
				cd /
				rm -rf /tmp/delete_temp/*
			fi
			;;		
	esac
done
cd /
rm -rf /sda1/data/firmware_update/delete-contents
echo -e "[ ${GREEN} Deleting Packages Contents Ends : `date` ${END} ]" >> $log_path
#END
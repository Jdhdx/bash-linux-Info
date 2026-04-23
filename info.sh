#!/bin/bash
#tool created by Jdhdx
#https://github.com/Jdhdx

Main_Menu(){
while true; do
	clear
	echo "======Main Menu========"
	echo "0. Install requirements"
	echo "1. Info menu"
	echo "2. Exit"
	read -p "choose: " choose
	case $choose in 
		0)
			sudo apt install lshw -y
			sudo apt install lscpu -y
			sudo apt install lsusb -y
			sudo apt install lspci -y
			sudo apt install lsscsi -y
			sudo apt install hdparm -y
			sudo apt install fdisk -y
			sudo apt install dmidecode -y
			sudo apt install inxi -y;;
		1)
			info_menu;;
		2)
			return;;
		*)
			echo "Enter valid option ";;
	esac
done
}

info_menu(){
clear
while true; do
	echo "=======Info Menu======"
	echo "1. Basic system and kernel information"
	echo "2. Comprehensive hardware listing"
	echo "3. Detailed CPU information"
	echo "4. Block device information"
	echo "5. USB controller and device details"
	echo "6. PCI device information"
	echo "7. SCSI/SATA device details"
	echo "8. Hard disk parameters"
	echo "9. RAM info"
	echo "10. Partition information"
	echo "11. DMI/SMBIOS hardware data"
	echo "12. All-in-one system information"
	echo "0. Return to main menu"
	read -p "choose: " choose
	case $choose in 
		1)
			echo "your system name: $(uname)"
			echo "your Linux network hostname: $(uname -n)"
			echo "your Linux kernel version: $(uname -v)"
			echo "your Linux kernel release: $(uname -r)"
			echo "your Linux hardware architecture: $(uname -m)";;
		2)
			sudo lshw;;
		3)
			lscpu;;
		4)
			lsblk -a;;
		5)
			lsusb -v;;
		6)
			lspci -t -v;;
		7)
			lsscsi -s;;
		8)
			sudo hdparm -i /dev/sda;;
		9)
			free -h;;
		10)
			sudo fdisk -l;;
		11)
			dmidecode_tool;;
		12)
			inxi -F;;
		0)
			return;;
		*)
			echo "Enter valid option ";;
	esac
done
}

dmidecode_tool(){
	clear
while true; do
	echo "=======DMI Decode Tool======"
	echo "1. Memory"
	echo "2. System"
	echo "3. BIOS"
	echo "4. Processor"
	echo "0. Return"
	read -p "choose: " choose
	case $choose in
		1)
			sudo dmidecode -t memory;;
		2)
			sudo dmidecode -t system;;
		3)
			sudo dmidecode -t bios;;
		4)
			sudo dmidecode -t processor;;
		0)
			return;;
		*)
			echo "Enter valid option ";;
	esac
done
}

Main_Menu


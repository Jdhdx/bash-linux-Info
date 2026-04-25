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
			install_requirements;;
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
install_requirements() {
    clear
    echo "Installing requirements..."

    if [ -f /etc/debian_version ]; then
        echo "Detected Debian-based system"
        sudo apt update
        sudo apt install -y lshw util-linux usbutils pciutils lsscsi hdparm fdisk dmidecode inxi

    elif [ -f /etc/fedora-release ]; then
        echo "Detected Fedora system"
        sudo dnf install -y lshw util-linux usbutils pciutils lsscsi hdparm util-linux dmidecode inxi

    elif [ -f /etc/arch-release ]; then
        echo "Detected Arch-based system"
        sudo pacman -Sy --noconfirm lshw util-linux usbutils pciutils lsscsi hdparm dmidecode inxi

    elif [ -f /etc/os-release ]; then
        . /etc/os-release

        case "$ID" in
            opensuse*|suse)
                echo "Detected openSUSE system"
                sudo zypper install -y lshw util-linux usbutils pciutils lsscsi hdparm dmidecode inxi
                ;;
            alpine)
                echo "Detected Alpine Linux"
                sudo apk add lshw util-linux usbutils pciutils lsscsi hdparm dmidecode inxi
                ;;
            *)
                echo "Unsupported or unknown distro: $ID"
                ;;
        esac

    else
        echo "Unsupported distribution"
        return
    fi

    echo "Installation complete!"
    read -p "Press Enter to continue..."
}
Main_Menu


#!/bin/sh

#check ubuntu version
check_version () {
version=$(lsb_release -sr)
if [ $version = 18.04 ]; then
        whiptail --title "Version" --msgbox "Your curent Ubuntu version is $version" 8 78
else
        whiptail --title "Upgrade" --msgbox "Your curent Ubuntu version is $version, This programm is for Ubuntu 18.04 only" 8 78
        exit
fi
}

#Install Ubuntu 20.04 LTS
run_installation () {
if (whiptail --title "Upgrade to Ubuntu 20.04" --yesno "Do you want to upgrade to Ubuntu 20.04" 8 78); then
        whiptail --title "Upgrade" --msgbox "Upgrading Ubuntu 18.04 to 20.04" 8 78
        
        sudo sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

        sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

        mkdir eoan_upgrade
 
        cd eoan_upgrade

        wget http://archive.ubuntu.com/ubuntu/dists/eoan-updates/main/dist-upgrader-all/current/eoan.tar.gz
        tar -xvzf  eoan.tar.gz

        sudo /home/$USERNAME/eoan_upgrade/eoan --frontend=DistUpgradeViewText
        
        sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
        sudo apt autoremove
        sudo apt install update-manager-core

else
        whiptail --title "Exit" --msgbox "You exited the programm." 8 78
        exit
fi
}

main () {
        check_version
        run_installation
}
main

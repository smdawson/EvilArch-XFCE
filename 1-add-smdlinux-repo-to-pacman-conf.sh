#!/bin/bash
set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# 
# Edit by	:	Seth Dawson
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "################################################"
echo "###          Adding SMDLinux Keys           ####"
echo "################################################"

echo "Receiving Key for SMD-Linux Packages"
sudo pacman-key --recv-keys BB31837564255477
echo "Verify Fingerprint"
sudo pacman-key --finger BB31837564255477
echo "Local Sign Imported Key"
sudo pacman-key --lsign-key BB31837564255477
echo "Refresh Keys"
sudo pacman-key --refresh-keys

echo "################################################"
echo "###          Added SMDLinux Keys            ####"
echo "################################################"

echo "################################################"
echo "###         Adding SMDLinux repo's          ####"
echo "################################################"

echo '
#[smdlinux_repo_testing]
#SigLevel = Required DatabaseOptional
#Server = https://repo.sethdawson.me/archlinux/$repo/$arch

[smdlinux_repo]
SigLevel = Required DatabaseOptional
Server = https://repo.sethdawson.me/archlinux/$repo/$arch

[smdlinux_repo_3party]
SigLevel = Required DatabaseOptional
Server = https://repo.sethdawson.me/archlinux/$repo/$arch
' | sudo tee --append /etc/pacman.conf

sudo pacman -Syyu

echo "################################################"
echo "###          SMDLinux repo's added          ####"
echo "################################################"

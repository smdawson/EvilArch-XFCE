##!/bin/bash
#set -e
#
##########################################################
#                                                        #
#               SMD-Arch-XFCE script                     #
#  ArchLinux Applications Automatic Installation Script  #
#  Inspired by                                           #
#  https://github.com/SofianeHamlaoui/ArchI0             #
#  And                                                   #
#  https://github.com/arcolinuxd/arco-xfce               #
##########################################################
#  +FIRST  : sudo chmod +x 5-smd-linux-repo.sh           #
#                (Give EXEC Access To Script)            #
#  +TO RUN    : ./5-smd-linux-repo.sh                    #
##########################################################
#                                                        #
#                DO NOT JUST RUN THIS.                   #
#       EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.         #
#                                                        #
##########################################################
#
#
#  TO DO:
#
#
######################## Variables #######################
#
# b=bold u=underline bl=black r=red g=green
# y=yellow bu=blue m=magenta c=cyan w=white
# endc=end-color enda=end-argument
b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'
version="20220430"

####################### Functions ########################

function install {
  # Check If Package Is Installed
  if pacman -Qi $1 &> /dev/null; then
      echo -e " [${g}✔${endc}]::[${b}"$1"${enda}] Is Already Installed!"
  else
      sudo pacman -S --noconfirm --needed $1
      # Verify Successful Installation
    if pacman -Qi $package &> /dev/null; then
      echo -e " [${g}✔${endc}]::[${b}"$1"${enda}]: Installed!"
    else
      echo -e " [${r}!${endc}]::[${b}"$1"${enda}]: ${r}NOT Installed!${endc}"
    fi
  fi
}

function category {
  echo -e " [${g}✔${endc}]::Installing Software For Category ${b}${bu}["$1"]${endc}${enda}"
  echo
}

function end_category {
  echo
  echo -e " [${g}✔${endc}]::Category ${bu}${b}["$1"]${enda}${endc} Installed!"
  echo
}

###############################################################################

category SMD-Arch-Linux

list=(
evilarch-plank-git
smdlinux-arc-themes-git
smdlinux-conky-git
smdlinux-fonts-git
smdlinux-geany-git
#smdlinux-kvantum-git
smdlinux-neofetch-git 
smdlinux-plank-themes-git 
smdlinux-qt5-git 
smdlinux-root-xfce-git  
smdlinux-wallpapers-git 
#smd-arch-xfce4-panel-profiles-git 
smdlinux-xfce-git 
smdlinux-config-xfce-git 
smdlinux-xfce-dconf-git
)

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category SMD-Arch-Linux
###############################################################################

echo
echo -e " [${g}✔${endc}]::[${g}${b}Copying all files and folders from /etc/skel to ~${enda}${endc}]"
echo
cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rT /etc/skel ~

echo -e " [${g}✔${endc}]::Software From ${b}${r}[SMD-Arch Repository]${endc}${enda} Installed"
echo
echo -e " ${bu}SMD-Arch Installation Script Version${b} $version ${enda} ${endc}"

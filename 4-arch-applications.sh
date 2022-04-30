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
#  +FIRST  : sudo chmod +x 4-arch-applications.sh        #
#                (Give EXEC Access To Script)            #
#  +TO RUN    : ./4-arch-applications.sh                 #
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

category Bash

list=(
cool-retro-term
cowfortune
fortune-mod
sl
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Bash

###############################################################################

category Accessories

list=(
catfish
conky-lua
conky-manager2-git
cronie
galculator
plank
xfburn
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Accessories

###############################################################################

category Development

list=(
arduino
arduino-docs
atom
devtools
geany
git
gitahead
meld
nano
xclip
vim
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

#echo -e " [${g}✔${endc}]::Installing Sublime Text${endc}"


#curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
#echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

#sudo pacman -Syu -S --noconfirm --needed sublime-text

end_category Development

###############################################################################

#category Games

#list=(
#kmines
#steam-native-runtime
#steam
#supertuxkart
#)

#count=0

#for name in "${list[@]}" ; do
#  count=$[count+1]
#  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
#  install $name
#done

#end_category Games

###############################################################################

category Graphics

list=(	
gimp
gnome-font-viewer
gpick
imagemagick
inkscape
nomacs
ristretto
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Graphics

###############################################################################

category OSINT

list=(  
httprobe-bin
subfinder
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category OSINT

###############################################################################

category Internet

list=(
discord_arch_electron
filezilla
firefox
hexchat
qbittorrent
telegram-desktop
w3m
wireshark-qt
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Internet

###############################################################################

category Multimedia

list=(
audacity
deadbeef
peek
pithos
vlc
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Multimedia

###############################################################################

category Office

list=(
evince
evolution
hunspell
hunspell-en_US
hyphen
hyphen-en
joplin
joplin-desktop
libmythes
mythes-en
libreoffice-fresh
obsidian
xmind
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Office

###############################################################################

category Settings

list=(
mugshot
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Settings

###############################################################################

category System

list=(
accountsservice
alacritty
baobab
curl
dconf-editor
dmenu 
dmidecode
emoji-keyboard
ffmpegthumbnailer
glances
gnome-disk-utility
gnome-keyring
gparted
go
grsync
gtk-engine-murrine
gvfs
gvfs-mtp
hardinfo
hddtemp
htop
inxi
kvantum-qt5
lm_sensors
lolcat
lsb-release
lxsession
mc
menulibre
mlocate
ncurses
neofetch
net-tools
numlockx
pamac-aur
polkit-gnome
qt5ct
reflector
sane
screenfetch
scrot
simple-scan
sysstat
terminator
thunar
thunar-archive-plugin
thunar-dropbox
thunar-volman 
tumbler
vnstat
wmctrl
unclutter
rxvt-unicode
urxvt-perls
whois
xdo
xdotool 
xfce4-notifyd
xfce4-panel-profiles
zenity
zsh
zsh-completions
zsh-syntax-highlighting
oh-my-zsh-git
oh-my-zsh-powerline-theme-git
bullet-train-oh-my-zsh-theme-git
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category System

###############################################################################

category Themes

list=(
arc-gtk-theme
sardi-icons
surfn-arc-breeze-icons-git
surfn-icons-git
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Themes

###############################################################################

category Unpack

list=(
unace
unrar
zip
unzip
sharutils
uudeview
arj
cabextract
file-roller
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Unpack

###############################################################################

category Utilities

list=(
bitwarden
boxes
dropbox
gotop-bin
the_platinum_searcher-bin
trizen
wget
yay
youtube-dl
yubikey-manager
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Utilities

###############################################################################

category XFCE4 Goodies

list=(
xfce4-clipman-plugin
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category XFCE4 Goodies

###############################################################################

echo -e " [${g}✔${endc}]::Software From ${b}${r}[Arch Linux Repository]${endc}${enda} Installed"
echo
echo -e " ${bu}SMD-Arch Installation Script Version${b} $version ${enda} ${endc}"

#! /bin/bash 

## Firewall

#UFW
sudo apt install ufw -y &&
sudo ufw default DENY incoming &&
sudo ufw default DENY outgoing &&
sudo ufw allow out 53 &&
sudo ufw allow out 80 &&
sudo ufw allow out 443 &&
sudo ufw enable &&

#Iptables
#echo "installing Firewall..."
#sudo apt-get install iptables -y &&
#sudo apt-get install wget -y &&
#mkdir /home/l/Security &&
#mkdir /home/l/Security/Iptables &&
#cd /home/l/Security/Iptables &&
#sudo wget https://paulorochacode.github.io/Costumization/iptables-desktop-lenovo &&
#sudo iptables-restore < iptables-desktop-lenovo &&
#sudo apt-get install iptables-persistent -y &&

## Updates

echo "installing Sistem updates..."
sudo apt update -y &&
sudo apt upgrade -y &&
sudo apt-get update -y &&
sudo apt-get upgrade -y &&
sudo apt update -y &&

## Antivirus

echo "installing Antivirus..."
sudo apt-get install clamav clamav-daemon -y &&

## Audio

echo "installing Audio..."
sudo apt remove pipewire* --purge -y &&
sudo apt remove alsa* --purge -y &&
sudo apt install pulseaudio -y &&

## Video

echo "installing Video..."
sudo apt install i3 -y &&
sudo apt install i3blocks -y &&
sudo apt install xorg -y &&
sudo apt install feh -y &&
sudo rm -rf /home/l/.config/i3/config &&
cd /home/l/.config/i3/ &&
sudo apt-get install unzip -y &&
sudo rm -rf ./* &&
sudo wget https://paulorochacode.github.io/Costumization/i3blocks.zip &&
unzip i3blocks.zip &&
sudo rm -rf i3blocks.zip &&
sudo wget https://paulorochacode.github.io/Costumization/config &&
sudo rm -rf /etc/i3blocks.conf &&
cd /etc/ &&
sudo wget https://paulorochacode.github.io/Costumization/i3blocks.conf &&
sudo wget https://paulorochacode.github.io/Costumization/wallpapers/fsociety.jpg &&
mv fsociety.jpg /usr/share/pixmaps/fsociety.jpg &&
sudo feh  --bg-scale /usr/share/pixmaps/fsociety.jpg && 
sudo wget https://paulorochacode.github.io/Costumization/wallpapers/fsociety.jpg &&
mv fsociety.jpg /usr/share/pixmaps/fsociety.jpg &&
sudo feh  --bg-scale /usr/share/pixmaps/fsociety.jpg &&

## Utilities

echo "installing Utilities..."
sudo apt install net-tools -y &&
sudo apt install feh -y &&
sudo apt install gnome-terminal -y &&
sudo apt install maim -y &&
sudo apt install slop -y &&
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF
&&
sudo sh -c "echo 'blacklist uvcvideo' >> /etc/modprobe.d/blacklist.conf" &&
## Bootloader

echo "installing Bootloader..."
sudo apt install build-essential -y &&
sudo apt install libpam0g-dev -y &&
sudo apt install libxcb-xkb-dev -y &&
sudo apt install git -y &&
sudo git clone --recurse-submodules https://github.com/nullgemm/ly &&
cd ly &&
sudo make &&
sudo make install &&
sudo systemctl enable ly.service -f &&
sudo systemctl disable getty@tty2.service -f &&
sudo reboot 


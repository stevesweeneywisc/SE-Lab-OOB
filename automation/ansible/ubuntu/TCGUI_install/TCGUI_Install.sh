#! /bin/bash

# Enable verbose execution of this script
set -v

echo ##########   start     ############
echo #####Ubuntu TCGUI Install##########

echo ##########   start     ############
echo ###### Application Install ########
sudo dpkg --configure -a
sudo apt install git iptables iproute2 python3-flask --assume-yes
echo ##########     end     ############
echo ###### Application Install ########

echo ########### start ################
echo # Change hostname and Wallpaper ##
### gsettings set org.gnome.desktop.background picture-uri file:////home/$USER/Pictures/Ubuntu-TCGUI.png
### gsettings set org.gnome.desktop.background picture-uri-dark file:////home/$USER/Pictures/Ubuntu-TCGUI.png
### gsettings set org.gnome.desktop.background picture-options 'stretched'
#sudo hostnamectl set-hostname TCGUI
echo ###########  end  ################
echo # Change hostname and Wallpaper ##

echo ##########   start     ############
echo ####### enable ip_forwad  #########
## https://askubuntu.com/questions/776929/how-to-edit-my-etc-sysctl-conf-file

echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf

echo ##########    end      ############
echo ####### enable ip_forwad  #########

echo ##########   start     ############
echo ######### rc.local file ###########
sudo chmod 755 rc.local
sudo chown root rc.local
sudo chown :root rc.local
sudo mv rc.local /etc/
echo ##########     end     ############
echo ######### rc.local file ###########

echo ##########   Start   ############
echo #### add tcgui.master file ######
sudo mkdir ../Documents/tcgui-master
sudo git clone https://github.com/tum-lkn/tcgui ../Documents/tcgui-master
sudo mv ./main.html ../Documents/tcgui-master/templates/
sudo mv ./Lab_Topology.png ../Documents/tcgui-master/static/
chmod 755 ./tcgui.sh
mv ./tcgui.sh ../
chmod 755 ./tcgui_all.sh
mv ./tcgui_all.sh ../

echo ##########   End     ############
echo #### add tcgui.master file ######

echo ##########   Start   ############
echo #### Create tcgui.service #######
sudo chmod 755 tcgui.service
sudo chown root tcgui.service
sudo chown :root tcgui.service
sudo mv tcgui.service /etc/systemd/system/

sudo systemctl start tcgui.service
sudo systemctl enable tcgui.service
echo ##########   End     ############
echo #### Create tcgui.service #######

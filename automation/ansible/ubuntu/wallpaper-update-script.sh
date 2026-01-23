#! /bin/bash

### Enable verbose execution of script ###
#set -v

echo ########### start ################
echo ####### Change Wallpaper #########

gsettings set org.gnome.desktop.background picture-uri file:////home/$USER/Pictures/${1}.png

gsettings set org.gnome.desktop.background picture-uri-dark file:////home/$USER/Pictures/${1}.png

gsettings set org.gnome.desktop.background picture-options 'stretched'

echo ###########  End  ################
echo ####### Change Wallpaper #########

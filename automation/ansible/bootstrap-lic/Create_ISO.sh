#! /bin/bash

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "Syntax:  Create_ISO.sh [device name]"
  echo " " 
  echo "Example: Create_ISO.sh Branch01" 
  echo " "
} 

##########   Start   ############
##### Identify Arguent Flags ####

while getopts :h flag
do 
  case "${flag}" in
    h) # display Help
	Help
	exit;; 
    \?) # Invalid option
	echo Invalid Option !!	
	Help	
	exit;; 
  esac
done
if (($# != 1))
then
   echo "Number of arguments should be 1"
   Help
   exit
fi

##########    End    ############
##### Identify Arguent Flags ####
echo
echo "Device Name     : $1";
echo

### Enable verbose execution of script ###
set -v

sudo rm config-drive/openstack/content/0000
sudo rm config-drive/openstack/latest/user_data

sudo cp $1.lic  config-drive/openstack/content/0000
sudo cp $1.user_data  config-drive/openstack/latest/user_data

xorriso -as mkisofs -V config-2 -o $1.iso config-drive/
mv $1.iso ./ISO

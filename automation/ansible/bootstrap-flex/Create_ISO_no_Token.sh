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
  echo "Example 1: Create_ISO.sh Branch01" 
  echo "Example 2: Create_ISO.sh Hub01a" 
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
echo "FortiGate Name   : $1";
echo "  license file   : $1.lic";
echo "  user_data file : $1.user_data";
echo "  ISO File       : $1.iso";
echo

### Enable verbose execution of script ###
set -v

#cp ./Tokens/$1.lic        ./license.txt
cp ./Config/$1.user_data  ./config.txt

#write-mime-multipart -o user_data config.txt license.txt
write-mime-multipart -o user_data config.txt 

rm config-drive/openstack/latest/user_data

cp  user_data   config-drive/openstack/latest/user_data

xorriso -as mkisofs -V config-2 -o $1_bootstrap.iso config-drive/
mv $1_bootstrap.iso ./ISO

rm user_data
rm config.txt
#rm license.txt

#! /bin/bash

yml_file="configure_fgt"

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [hosts group]"
  echo " " 
  echo "Example 1:  $yml_file.sh  fortigate_sdwan"
  echo " "
} 

##########   Start   ############
##### Identify Argument Flags ####
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

echo "hosts_group        : $1";

### Enable verbose execution of script ###
set -v

ansible-playbook $yml_file.yml --extra-vars "hosts_group=$1"

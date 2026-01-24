#! /bin/bash

yml_file="create-vm"

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [host vars file name] [pve node] [group] [image name]"
  echo " " 
  echo "Example 1:  $yml_file.sh  ../vars/all-hosts.yml pve02 fmg              v7.4.8.M"
  echo "Example 2:  $yml_file.sh  ../vars/all-hosts.yml pve02 faz              v7.4.8.M"
  echo "Example 3:  $yml_file.sh  ../vars/all-hosts.yml pve01 fortigate_sdwan  v7.6.4.F"
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
if (($# != 4))
then
   echo "Number of arguments should be 4"
   Help
   exit
fi
##########    End    ############
##### Identify Arguent Flags ####

echo "host_vars_file   : $1";
echo "pve_node         : $2";
echo "group_name       : $3";
echo "image_name       : $4";

### Enable verbose execution of script ###
set -v

ansible-playbook $yml_file.yml --extra-vars "host_vars_file=$1 pve_node=$2 group_name=$3 image_name=$4"

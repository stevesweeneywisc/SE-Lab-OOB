#! /bin/bash

yml_file="create_sdn_vnets"

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [ pve node]"
  echo " " 
  echo "Example 1:  $yml_file.sh  pve01"
  echo "Example 2:  $yml_file.sh  pve02"
  echo "NOTE: if pve0x's are in a cluster, only need to execute this on ONE pve server"
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

echo "pve_node       : $1";

### Enable verbose execution of script ###
set -v

ansible-playbook $yml_file.yml --extra-vars "pve_node=$1"

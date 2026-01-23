#! /bin/bash

yml_file="copy_fgt_bootstrap_iso"

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [vars host file name] [pve node]" 
  echo " " 
  echo "Example 1:  $yml_file.sh  ../vars/ubuntu3-4.yml pve02"
  echo "Example 2:  $yml_file.sh  ../vars/all-hosts.yml pve01"
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
if (($# != 2))
then
   echo "Number of arguments should be 2"
   Help
   exit
fi
##########    End    ############
##### Identify Arguent Flags ####

echo "host_file        : $1";
echo "pve_node         : $2";

### Enable verbose execution of script ###
set -v

ansible-playbook $yml_file.yml --extra-vars "host_vars_file=$1 pve_node=$2" 

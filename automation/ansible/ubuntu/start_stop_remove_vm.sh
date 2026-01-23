#! /bin/bash

yml_file="start_stop_remove_vm"

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [vars host file name] [pve node] [group] [started | stopped | absent ]"
  echo " "
  echo "Example 1:  $yml_file.sh  ../vars/ubuntu3-4.yml pve02 ubuntu_other started"
  echo "Example 2:  $yml_file.sh  ../vars/all-hosts.yml pve01 ubuntu_sdwan stopped"
  echo "Example 3:  $yml_file.sh  ../vars/all-hosts.yml pve01 ubuntu_tcgui absent"
  echo "Example 4:  $yml_file.sh  ../vars/all-hosts.yml pve03 ubuntu_oob   absent"
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
echo "start_stop       : $4";

### Enable verbose execution of script ###
set -v

ansible-playbook $yml_file.yml --extra-vars "host_vars_file=$1 pve_node=$2 group_name=$3 start_stop=$4"

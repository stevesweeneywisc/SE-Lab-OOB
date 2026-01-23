#! /bin/bash

yml_file=cli_config

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [vars host file]"
  echo " " 
  echo "Example 1:  $yml_file.sh  ../vars/all-hosts.yml fortigate_sdwan"
  echo "Example 1:  $yml_file.sh  ../vars/all-hosts.yml fmg_faz"
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
echo "group_name       : $2";

### Enable verbose execution of script ###
set -v

ansible-playbook $yml_file.yml --extra-vars "host_vars_file=$1 group_name=$2"

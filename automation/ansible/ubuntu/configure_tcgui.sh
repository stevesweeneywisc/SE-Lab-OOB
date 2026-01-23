#! /bin/bash

yml_file="configure_tcgui"

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [group]"
  echo " " 
  echo "Example 1:  $yml_file.sh  ubuntu_tcgui"
  echo " "
  echo "This is the way"
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

echo "group_name       : $1";

### Enable verbose execution of script ###
set -v

ansible-playbook $yml_file.yml --extra-vars "group_name=$1"

#! /bin/bash

yml_file="Make_All_ISOs"

###### Display Help ######
Help()
{
  # Display Help
  echo
  echo "-----"
  echo "Usage"
  echo "-----"
  echo "$yml_file.sh [with | no]"
  echo " "
  echo "Example 1:  $yml_file.sh  with"
  echo "Example 2:  $yml_file.sh  no"
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
#########    End    ############
##### Identify Arguent Flags ####

echo "with or no    : $1";

### Enable verbose execution of script ###
set -v

###### Make all ISO's  ######

./Create_ISO_$1_Token.sh FGT-Branch-01

read "Press enter to continue"

./Create_ISO_$1_Token.sh  FGT-Branch-02

read  "Press enter to continue"

./Create_ISO_$1_Token.sh  FGT-Branch-03

read  "Press enter to continue"

./Create_ISO_$1_Token.sh  FGT-Hub-01a

read  "Press enter to continue"

./Create_ISO_$1_Token.sh  FGT-Hub-01b

read  "Press enter to continue"

./Create_ISO_$1_Token.sh  FGT-Hub-02a

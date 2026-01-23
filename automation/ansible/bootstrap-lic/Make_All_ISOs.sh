#! /bin/bash

###### Make all ISO's  ######

./Create_ISO.sh Branch01

read -p "Press enter to continue"

./Create_ISO.sh Branch02

read -p "Press enter to continue"

./Create_ISO.sh Branch03

read -p "Press enter to continue"

./Create_ISO.sh Hub01a

read -p "Press enter to continue"

./Create_ISO.sh Hub01b

read -p "Press enter to continue"

./Create_ISO.sh Hub02a

read -p "Press enter to continue"

./Create_ISO.sh FGT_VPN

read -p "Press enter to continue"

./Create_ISO.sh First_Floor 

read -p "Press enter to continue"

./Create_ISO.sh vWirePair01

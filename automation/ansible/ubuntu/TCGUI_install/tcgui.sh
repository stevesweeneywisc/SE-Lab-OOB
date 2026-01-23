#! /bin/bash

### Wait 30secs before starting ###
sleep 30

### Start TCGUI web application ###
sudo python3 /home/fortinet/Documents/tcgui-master/main.py --ip 172.16.3.90 --port 8080 --dev eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8 eth9 eth10 


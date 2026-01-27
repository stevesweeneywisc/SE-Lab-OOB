#! /bin/bash

# Enable verbos execution of this script
set -v

pvesh create /cluster/sdn/zones --type vlan     --zone SELab --ipam  pve         --bridge vmbr0
pvesh create /cluster/sdn/vnets --vnet FTNTMGT  --zone SELab --alias FTNT_MGT    --tag 1001 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN1 --zone SELab --alias Branch_WAN1 --tag 1101 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN2 --zone SELab --alias Branch_WAN2 --tag 1102 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN3 --zone SELab --alias Branch_WAN3 --tag 1103 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN4 --zone SELab --alias Branch_WAN4 --tag 1104 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN5 --zone SELab --alias Branch_WAN5 --tag 1105 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN6 --zone SELab --alias Branch_WAN6 --tag 1106 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN7 --zone SELab --alias Branch_WAN7 --tag 1107 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHWAN8 --zone SELab --alias Branch_WAN8 --tag 1108 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHLAN1 --zone SELab --alias Branch_LAN1 --tag 1151 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHLAN2 --zone SELab --alias Branch_LAN2 --tag 1152 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHLAN3 --zone SELab --alias Branch_LAN3 --tag 1153 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet BRCHLAN4 --zone SELab --alias Branch_LAN4 --tag 1154 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet COREWAN1 --zone SELab --alias Core_WAN1   --tag 1201 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet COREWAN2 --zone SELab --alias Core_WAN2   --tag 1202 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet COREWAN3 --zone SELab --alias Core_WAN3   --tag 1203 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet COREWAN4 --zone SELab --alias Core_WAN4   --tag 1204 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet ISFW01   --zone SELab --alias ISFW_01     --tag 1251 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet ISFW02   --zone SELab --alias ISFW_02     --tag 1252 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet DMZ01    --zone SELab --alias DMZ_01      --tag 1275 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet DMZ02    --zone SELab --alias DMZ_02      --tag 1276 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet HAHUB01  --zone SELab --alias HA_HUB01    --tag 1291 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet HAHUB02  --zone SELab --alias HA_HUB02    --tag 1292 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet OFFNET   --zone SELab --alias OFF_NET     --tag 1301 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet MFGLINE1 --zone SELab --alias MFG_Line01  --tag 1401 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet MFGLINE2 --zone SELab --alias MFG_Line02  --tag 1402 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet MFGLINE3 --zone SELab --alias MFG_Line03  --tag 1403 --vlanaware true
pvesh create /cluster/sdn/vnets --vnet MFGLINE4 --zone SELab --alias MFG_Line04  --tag 1404 --vlanaware true
pvesh set /cluster/sdn

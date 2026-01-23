#! /bin/bash

# Enable verbose execution of this script
set -v

echo ##########   start     ############
echo ##### homepage container ##########
sudo docker compose -f /home/fortinet/c_data/homepage/docker-compose.yml up -d
sudo docker compose -f /home/fortinet/c_data/guacamole/docker-compose.yml up -d
sudo docker compose -f /home/fortinet/c_data/coredns/docker-compose.yml up -d
sudo docker load    -i /home/fortinet/c_data/foaas/foaas.tar.gz 
sudo docker compose -f /home/fortinet/c_data/foaas/docker-compose.yml up -d
echo ##########     end     ############
echo ##### homepage container ##########

rm OOB_Containers.sh


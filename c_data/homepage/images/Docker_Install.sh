#! /bin/bash

### Enable verbose execution of script ###
set -v


echo ########### start ################
echo ####### Install Docker  ##########
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common --assume-yes
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install docker-ce --assume-yes

echo ##########    end     ############
echo ####### Install Docker  ##########

echo ########### start ################
echo #### Install Docker Compose ######

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

echo ##########    end     ############
echo #### Install Docker Compose ######

echo ########### start ################
echo ## Execute Docker without sudo ###
sudo usermod -aG docker ${USER}

echo ## Execute Docker without sudo ###
echo ##########    end     ############

rm Docker_Install.sh

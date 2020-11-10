#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

sudo apt-get -y update
sudo apt-get -y upgrade

sudo add-apt-repository -y ppa:apt-fast/stable < /dev/null
sudo echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
sudo echo debconf apt-fast/dlflag boolean true | debconf-set-selections
sudo echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
sudo apt install -y apt-fast

sudo apt-fast install -y apt-transport-https
sudo apt-fast install -y libcurl4-openssl-dev
sudo apt-fast install -y libssl-dev
sudo apt-fast install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-fast install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-fast install -y python-setuptools
sudo apt-fast install -y libldns-dev
sudo apt-fast install -y python3-pip
sudo apt-fast install -y python-dnspython
sudo apt-fast install -y git
echo ""
echo ""
sar 1 1 >/dev/null

#Setting shell functions/aliases
echo "${GREEN} [+] Setting bash_profile aliases ${RESET}"
curl https://raw.githubusercontent.com/unethicalnoob/aliases/master/bashprofile > ~/.bash_profile
echo "${BLUE} If it doesn't work, set it manually ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null 

echo "${GREEN} [+] Installing Golang ${RESET}"
if [ ! -f /usr/bin/go ];then
    cd ~
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
	export GOROOT=$HOME/.go
	export PATH=$GOROOT/bin:$PATH
	export GOPATH=$HOME/go
    echo 'export GOROOT=$HOME/.go' >> ~/.bash_profile
	
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile 
else 
    echo "${BLUE} Golang is already installed${RESET}"
fi
    break
echo""
echo "${BLUE} Done Install Golang ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null


echo "${BLUE} installing dalfox${RESET}"
git clone https://github.com/hahwul/dalfox ~/code/lab/scripts/tools//dalfox
cd ~/code/lab/scripts/tools/dalfox/ && go build dalfox.go
sudo cp dalfox /usr/bin/
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing Paramspider${RESET}"
git clone https://github.com/devanshbatham/ParamSpider ~/code/lab/scripts/tools/ParamSpider
cd ~/code/lab/scripts/tools/ParamSpider
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing aem-hacker${RESET}"
git clone https://github.com/0ang3el/aem-hacker.git ~/code/lab/scripts/tools/aem-hacker
cd ~/code/lab/scripts/tools/aem-hacker
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

go get -u github.com/projectdiscovery/httpx/cmd/httpx
go get -u github.com/tomnomnom/gron

cd "/content/drive/My Drive/"
bash colab.sh

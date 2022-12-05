#!/bin/bash
echo -e "\033[0;35m"
echo "  _     ___  ____ ____  _   _  ___  ____  _____ ";
echo " | |   / _ \/ ___/ ___|| \ | |/ _ \|  _ \| ____|";
echo " | |  | | | \___ \___ \|  \| | | | | | | |  _|  ";
echo " | |__| |_| |___) |__) | |\  | |_| | |_| | |___ ";
echo " |_____\___/|____/____/|_| \_|\___/|____/|_____|";
echo -e "\e[0m"

sleep 3

echo -e "\e[1m\e[32m1. Sunucu guncellemesi yapiliyor, gerekli kutuphaneler indiriliyor, screen yukleniyor.. \e[0m"
echo "======================================================"
sleep 1
sudo apt update && sudo apt upgrade -y
sudo apt install pkg-config curl git build-essential libssl-dev libclang-dev -y
apt-get install libclang-dev -y
sudo apt install screen -y

echo -e "\e[1m\e[32m2. Rust yukleniyor.. \e[0m"
echo "======================================================"
sleep 1
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustc --version
rustup toolchain install nightly
rustup default nightly

cd $HOME

echo -e "\e[1m\e[32m3. Binary dosyalari yukleniyor.. \e[0m"
echo "======================================================"
sleep 1
git clone --branch testnet https://github.com/massalabs/massa.git
cd massa/massa-node/

if [ ! $PASSWORD ]; then
	read -p "Massa node'u icin sifrenizi girin: " PASSWORD
	echo 'export PASSWORD='$PASSWORD >> $HOME/.bash_profile
fi
source $HOME/.bash_profile

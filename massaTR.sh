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
sudo apt install screen -y

echo -e "\e[1m\e[32m2. Rust yukleniyor.. \e[0m"
echo "======================================================"
sleep 1
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup toolchain install nightly
rustup default nightly

echo -e "\e[1m\e[32m3. Binary dosyalari yukleniyor.. \e[0m"
echo "======================================================"
sleep 1
git clone --branch testnet https://github.com/massalabs/massa.git

if [ ! $PASSWORD ]; then
	read -p "Massa node'u icin sifrenizi girin: " PASSWORD
	echo 'export PASSWORD='$PASSWORD >> $HOME/.bash_profile
fi

echo -e "\e[1m\e[32m4. Servis dosyasi olusturuluyor.. \e[0m"
echo "======================================================"
sleep 1

printf "[Unit]
Description=Massa Node
After=network-online.target
[Service]
User=$USER
WorkingDirectory=$HOME/massa/massa-node
ExecStart=$HOME/massa/massa-node/massa-node -p $PASSWORD
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/massad.service

echo -e "\e[1m\e[32m5. Servis baslatiliyor.. \e[0m"
echo "======================================================"
sleep 1
sudo systemctl daemon-reload
sudo systemctl enable massad
sudo systemctl restart massad

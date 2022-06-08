#!/bin/sh
VERSION=1.2.0.0

clear
echo "Starting DAPS Masternode update script"
echo "Stopping dapscoind..."
dapscoin-cli stop
echo "Downloading update..."
wget -N https://github.com/DAPSCoin/DAPSCoin/releases/download/$VERSION/dapscoin-v$VERSION-linux.zip
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Extracting update..."
sudo unzip -jo dapscoin-v$VERSION-linux.zip -d /usr/local/bin
echo "Set permissions on files..."
sudo chmod +x /usr/local/bin/daps*
echo "Running dapscoind..."
dapscoind -daemon
echo "Cleaning up..."
cd
rm -rf dapscoin-v$VERSION-linux.zip
echo "Update completed!"

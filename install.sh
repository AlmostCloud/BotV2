#!/bin/bash

echo "🅰🅻🅼🅾🆂🆃 🅲🅻🅾🆄🅳"

echo Make your own Free VPS Hosting, Dont Allow Mining

read -p "Are you sure you want to proceed? Agree to not allow mining (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

cd ~

echo "Installing python3-pip and docker."
sudo apt update
sudo apt install -y python3-pip docker.io
sudo docker build -t ubuntu-22.04-with-tmate .
wget -O main.py https://raw.githubusercontent.com/AlmostCloud/discord-vps-creator/refs/heads/main/v2
echo Downloaded successfully
echo "Installing Python packages: discord and docker..."
pip3 install discord docker
echo "Please enter your Discord bot token, Make a bot at discord.dev and get the token, You dont need any intents:"
read -r DISCORD_TOKEN
echo "Updating main.py with the provided Discord token..."
sed -i "s/TOKEN = ''/TOKEN = '$DISCORD_TOKEN'/" main.py
echo "Starting the Discord bot..."
echo "To start the bot in the future, run: python3 main.py"
python3 main.py

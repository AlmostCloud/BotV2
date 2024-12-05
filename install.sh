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
sudo apt install python3 -y
git clone https://github.com/AlmostCloud/katy-vps-fix.git
cd katy-vps-fix
docker build -t ubuntu-22.04-with-tmate -f Dockerfile1 . && docker build -t debian-with-tmate -f Dockerfile2 .
echo Downloaded successfully
echo "Installing Python packages: discord and docker..."
pip3 install discord docker
echo "Please enter your Discord bot token, Make a bot at discord.dev and get the token, You dont need any intents:"
read -r DISCORD_TOKEN
echo "Updating main.py with the provided Discord token..."
sed -i "s/TOKEN = ''/TOKEN = '$DISCORD_TOKEN'/" v2.py
mv v2.py main.py
echo "Starting the Discord bot..."
echo "To start the bot in the future, run: python3 main.py"
python3 main.py

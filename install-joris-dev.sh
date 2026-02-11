#!/usr/bin/env bash
set -e

echo "=== Updating system ==="
sudo apt update
sudo apt upgrade -y


echo "=== Installing 1Password ==="

curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] \
https://downloads.1password.com/linux/debian/amd64 stable main" | \
sudo tee /etc/apt/sources.list.d/1password.list

sudo apt update
sudo apt install -y 1password



echo "=== Installing base packages ==="
sudo apt install -y \
    git \
    curl \
    wget \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    flatpak \
    ubuntu-restricted-extras \
    mint-meta-codecs \
    vlc \
    celluloid \
    strawberry \
    audacious \
    sublime-text \
    geany \
    libreoffice \
    nextcloud-desktop \
    fonts-open-sans \
    fonts-lato

echo "=== Enable Flatpak Flathub ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "=== Installing Spotify ==="
flatpak install -y flathub com.spotify.Client

echo "=== Installing Plex HTPC ==="
flatpak install -y flathub tv.plex.PlexHTPC

echo "=== Installing GitHub Desktop (community build) ==="
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/shiftkey.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey.gpg] https://apt.packages.shiftkey.dev/ubuntu any main" | sudo tee /etc/apt/sources.list.d/shiftkey.list
sudo apt update
sudo apt install -y github-desktop

echo "=== Installing GitKraken ==="
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo apt install -y ./gitkraken-amd64.deb
rm gitkraken-amd64.deb

echo "=== Installing VS Code ==="
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code
rm microsoft.gpg

echo "=== Installing additional media codecs ==="
sudo apt install -y ffmpeg gstreamer1.0-libav gstreamer1.0-plugins-ugly

echo "=== Installing Microsoft core fonts ==="
sudo apt install -y ttf-mscorefonts-installer

echo "=== Installing custom OTF fonts (if present) ==="
if [ -d "./custom-fonts" ]; then
    mkdir -p ~/.local/share/fonts
    cp ./custom-fonts/*.otf ~/.local/share/fonts/ || true
    fc-cache -f -v
fi


echo "=== Installing Brave ==="

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
https://brave-browser-apt-release.s3.brave.com/ stable main" | \
sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install -y brave-browser



echo "=== Installing Google Chrome ==="

wget -qO- https://dl.google.com/linux/linux_signing_key.pub | \
sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] \
http://dl.google.com/linux/chrome/deb/ stable main" | \
sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt update
sudo apt install -y google-chrome-stable



echo "=== Installing Discord ==="

wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord.deb
rm discord.deb



echo "=== Installing Sublime Text repo (if not installed yet) ==="
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /usr/share/keyrings/sublimehq.gpg
echo "deb [signed-by=/usr/share/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text

echo "=== Done ==="
echo "Reboot recommended."

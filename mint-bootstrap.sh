#!/usr/bin/env bash
set -e

echo "======================================"
echo " Linux Mint Full Desktop Bootstrap"
echo "======================================"

### -------------------------
### UPDATE
### -------------------------

sudo apt update
sudo apt upgrade -y

### -------------------------
### ARCH SUPPORT (Steam/Wine)
### -------------------------

sudo dpkg --add-architecture i386
sudo apt update

### -------------------------
### BASE TOOLS
### -------------------------

sudo apt install -y \
curl wget gnupg ca-certificates \
software-properties-common \
apt-transport-https \
build-essential

### -------------------------
### MEDIA & CREATION
### -------------------------

sudo apt install -y \
torbrowser-launcher \
vlc mpv celluloid haruna \
kdenlive obs-studio \
ffmpeg handbrake audacity

### -------------------------
### GAMING
### -------------------------

sudo apt install -y steam
sudo add-apt-repository -y ppa:lutris-team/lutris
sudo apt update
sudo apt install -y lutris

### -------------------------
### OFFICE
### -------------------------

sudo apt install -y libreoffice

### -------------------------
### SECURITY
### -------------------------

sudo apt install -y clamav clamtk
sudo freshclam || true

### -------------------------
### NETWORK & SYNC
### -------------------------

sudo apt install -y \
transmission syncthing nextcloud-desktop \
nmap

### -------------------------
### SYSTEM TOOLS
### -------------------------

sudo apt install -y \
timeshift kdeconnect \
gparted gnome-tweaks \
flameshot bleachbit \
flatpak fsearch cpu-x

### -------------------------
### DEV TOOLS
### -------------------------

sudo apt install -y \
git lazygit micro \
ripgrep fd-find jq bat

### -------------------------
### NODE LTS
### -------------------------

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

echo "Node installed:"
node -v
npm -v

### -------------------------
### FLATPAK
### -------------------------

sudo flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

### -------------------------
### DRIVER & FIRMWARE CHECK
### -------------------------

sudo apt install -y fwupd || true
sudo fwupdmgr refresh || true
sudo fwupdmgr get-updates || true
sudo ubuntu-drivers autoinstall || true

### -------------------------
### TIMESHIFT SNAPSHOT
### -------------------------

sudo timeshift --create \
--comments "Post-bootstrap snapshot" \
--tags D || true

### -------------------------
### WALLPAPER (Cinnamon)
### -------------------------

WALL="/usr/share/backgrounds/linuxmint/default_background.jpg"

if [ -f "$WALL" ]; then
  gsettings set org.cinnamon.desktop.background picture-uri "file://$WALL" || true
fi

### -------------------------
### CLEANUP
### -------------------------

flatpak update -y || true
sudo apt autoremove -y
sudo apt autoclean

### -------------------------
### OPTIONAL HOST TOOLS
### -------------------------

# sudo apt install -y virtualbox
# sudo apt install -y virt-manager

### -------------------------
### DONE
### -------------------------

echo ""
echo "======================================"
echo " Installatie voltooid"
echo "======================================"

read -p "Nu herstarten? (y/n): " answer
if [ "$answer" = "y" ]; then
  sudo reboot
fi

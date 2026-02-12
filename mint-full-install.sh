echo "=== SECURITY BASELINE START ==="

# mirrors refresh (huidige configuratie respecteren)
sudo apt update

# alle security patches + bugfixes
sudo apt upgrade -y
sudo apt dist-upgrade -y

# verwijder oude kwetsbare packages
sudo apt autoremove -y

# security update mechanisme
sudo apt install -y unattended-upgrades apt-listchanges

# unattended security upgrades activeren
sudo dpkg-reconfigure -plow unattended-upgrades

# firewall aan (default deny inbound)
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# firmware update tooling
sudo apt install -y fwupd
sudo fwupdmgr refresh || true
sudo fwupdmgr get-updates || true

# controle op reboot nodig
if [ -f /var/run/reboot-required ]; then
  echo "REBOOT REQUIRED"
fi

echo "=== SECURITY BASELINE DONE ==="





echo "=== Install 1Password ==="

# keyring map
sudo mkdir -p /etc/apt/keyrings

# GPG sleutel importeren
curl -sS https://downloads.1password.com/linux/keys/1password.asc \
 | sudo gpg --dearmor --output /etc/apt/keyrings/1password.gpg

# repo toevoegen
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/1password.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" \
 | sudo tee /etc/apt/sources.list.d/1password.list > /dev/null

# package lijst verversen
sudo apt update

# installeren
sudo apt install -y 1password

echo "=== 1Password installed ==="





#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSET_DIR="$SCRIPT_DIR/assets"
WALLPAPER="$ASSET_DIR/linux-wallpaper.png"

echo "======================================"
echo " Linux Mint Full Desktop Bootstrap"
echo "======================================"
echo "Repo pad: $SCRIPT_DIR"

### -------------------------
### BELGIË MIRRORS
### -------------------------

echo "== Mirrors instellen op België =="

sudo sed -i 's|archive.ubuntu.com|be.archive.ubuntu.com|g' /etc/apt/sources.list || true
sudo sed -i 's|security.ubuntu.com|be.archive.ubuntu.com|g' /etc/apt/sources.list || true
sudo sed -i 's|packages.linuxmint.com|ftp.belnet.be/linuxmint-packages|g' \
/etc/apt/sources.list.d/official-package-repositories.list || true

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
### MEDIA & CREATIE
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

echo "== Lutris PPA =="
sudo add-apt-repository -y ppa:lutris-team/lutris
sudo apt update
sudo apt install -y lutris

echo "== OpenRA PPA =="
sudo add-apt-repository -y ppa:openra/ppa
sudo apt update
sudo apt install -y openra

### -------------------------
### WINE
### -------------------------

sudo apt install -y wine64 wine32 winetricks

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
### NETWERK & SYNC
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
ripgrep f

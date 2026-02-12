#!/usr/bin/env bash
set -e

echo "=============================="
echo " Linux Mint Bootstrap Script"
echo "=============================="

echo ""
echo "== Systeem update =="
sudo apt update
sudo apt upgrade -y

echo ""
echo "== i386 architectuur voor Steam/Wine =="
sudo dpkg --add-architecture i386
sudo apt update

echo ""
echo "== Basis packages =="
sudo apt install -y \
curl wget gnupg ca-certificates \
software-properties-common \
apt-transport-https \
build-essential

echo ""
echo "== Media & creators =="
sudo apt install -y \
torbrowser-launcher \
vlc mpv celluloid haruna \
kdenlive obs-studio \
ffmpeg handbrake audacity

echo ""
echo "== Gaming basis =="
sudo apt install -y steam

echo ""
echo "== Lutris officiële repository =="
sudo add-apt-repository -y ppa:lutris-team/lutris
sudo apt update
sudo apt install -y lutris

echo ""
echo "== Office =="
sudo apt install -y libreoffice

echo ""
echo "== Security (ClamAV + GUI) =="
sudo apt install -y clamav clamtk
sudo systemctl enable clamav-freshclam || true
sudo systemctl start clamav-freshclam || true

echo ""
echo "== Netwerk & sync =="
sudo apt install -y \
transmission \
syncthing \
nextcloud-desktop \
nmap

echo ""
echo "== Systeem tools =="
sudo apt install -y \
timeshift \
kdeconnect \
gparted \
gnome-tweaks \
flameshot \
bleachbit \
flatpak \
fsearch \
cpu-x

echo ""
echo "== Developer tools =="
sudo apt install -y \
git lazygit micro \
ripgrep fd-find jq bat

echo ""
echo "== Node.js LTS (NodeSource) =="
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

echo ""
echo "Node versie:"
node -v
npm -v

echo ""
echo "== Flatpak Flathub repo =="
sudo flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

echo ""
echo "== Optionele host tools (uitgeschakeld) =="
# sudo apt install -y virtualbox
# sudo apt install -y virt-manager

echo ""
echo "== Cleanup =="
sudo apt autoremove -y

echo ""
echo "=============================="
echo " Bootstrap voltooid"
echo "=============================="

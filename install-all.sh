# chmod +x install-all.sh

#!/usr/bin/env bash
set -e

echo "=== Updating system ==="
sudo apt update
sudo apt upgrade -y

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
    wine \
    winetricks \
    steam-installer

echo "=== Enable Flathub ==="
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "=== Installing VS Code ==="
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code
rm microsoft.gpg

echo "=== Installing GitHub Desktop ==="
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/shiftkey.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey.gpg] https://apt.packages.shiftkey.dev/ubuntu any main" | sudo tee /etc/apt/sources.list.d/shiftkey.list
sudo apt update
sudo apt install -y github-desktop

echo "=== Installing GitKraken ==="
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo apt install -y ./gitkraken-amd64.deb
rm gitkraken-amd64.deb

echo "=== Installing Obsidian ==="
flatpak install -y flathub md.obsidian.Obsidian

echo "=== Installing 1Password ==="
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] \
https://downloads.1password.com/linux/debian/amd64 stable main" | \
sudo tee /etc/apt/sources.list.d/1password.list
sudo apt update
sudo apt install -y 1password

echo "=== Installing WhiteSur Dark Theme ==="

mkdir -p ~/.themes
mkdir -p ~/.icons
mkdir -p ~/.local/share/themes
mkdir -p ~/.local/share/icons

sudo apt install -y \
    gtk2-engines-murrine \
    gtk2-engines-pixbuf \
    sassc \
    libglib2.0-dev-bin \
    plank \
    fonts-inter

cd /tmp
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -d

cd /tmp
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
cd WhiteSur-icon-theme
./install.sh

xfconf-query -c xsettings -p /Net/ThemeName -s "WhiteSur-Dark"
xfconf-query -c xfwm4 -p /general/theme -s "WhiteSur-Dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "WhiteSur"
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "WhiteSur-cursors"
xfconf-query -c xsettings -p /Gtk/FontName -s "Inter 10"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "Inter 10"

mkdir -p ~/.config/autostart
cat <<EOF > ~/.config/autostart/plank.desktop
[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Plank
EOF

echo "=== All installations complete ==="
echo "Reboot recommended."

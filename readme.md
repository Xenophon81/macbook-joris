Hier is een professionele maar persoonlijke README.md die je direct in je GitHub-repo kunt plaatsen.

Je kunt hem letterlijk kopiëren naar README.md.

💻 Joris Dev Machine
Linux Mint XFCE Setup Blueprint

A reproducible Linux Mint XFCE development and media workstation configuration — originally designed for a MacBook Pro 13" (Mid 2011), but portable to any compatible x86 system.

This repository contains:

Automated install script

Media + codec setup

Development tooling

Desktop applications

Font configuration

Reproducible environment principles

🎯 Purpose

This project exists to:

Create a stable Linux Mint XFCE development environment

Provide a clean, script-based setup

Avoid manual post-install chaos

Keep systems reproducible and version-controlled

Combine dev, media, and daily workflow tools in one place

🧱 Stack Overview
🔧 Development

Git

GitHub Desktop (ShiftKey build)

GitKraken

Visual Studio Code

Sublime Text

Geany

🎵 Media

Spotify (Flatpak)

Strawberry

Audacious

VLC

Celluloid

Plex HTPC (Flatpak)

🧮 Productivity

LibreOffice

Nextcloud Desktop

🎬 Codecs

ubuntu-restricted-extras

mint-meta-codecs

ffmpeg

GStreamer plugins

🔤 Fonts

Open Sans

Lato

Microsoft Core Fonts

Custom OTF support (Superclarendon, Kefa PressS, etc.)

🚀 Installation
1️⃣ Clone the repository
git clone https://github.com/YOUR_USERNAME/joris-dev-machine.git
cd joris-dev-machine

2️⃣ Make script executable
chmod +x install-joris-dev.sh

3️⃣ Optional: Add custom fonts

Create folder:

custom-fonts/


Add:

Superclarendon.otf
KefaPressS.otf

4️⃣ Run installer
./install-joris-dev.sh

5️⃣ Reboot
sudo reboot

🖥 Recommended Hardware

Optimized for:

Intel x86_64

8–16GB RAM

SSD storage

Linux Mint XFCE

Originally built for:

MacBook Pro 13" (Mid 2011, A1278)

🔥 Optional Post-Install (Thermal Optimization)

Recommended for older MacBooks:

sudo apt install tlp mbpfan
sudo systemctl enable tlp
sudo systemctl start tlp


Improves:

Battery life

Thermal behavior

Fan noise

🧪 Reproducibility

Export installed packages:

dpkg --get-selections > packages.txt
flatpak list --app --columns=application > flatpaks.txt


This allows environment recreation.

🧠 Philosophy

This is not a “dotfiles dump.”
It is:

Structured

Script-driven

Transparent

Version-controlled

No hidden tweaks.
No undocumented manual steps.

Everything reproducible.

📜 License

MIT License (recommended — change if needed)

🛠 Future Improvements

Modular installer flags

Docker service layer

Ansible conversion

Hardware-specific profile (MacBook 2011 tuning)

Auto dotfile provisioning
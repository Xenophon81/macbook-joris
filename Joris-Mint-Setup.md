Hieronder staat een kant-en-klare Markdown handleiding die je als
Joris-Mint-Setup.md kunt opslaan in je repo of Obsidian vault.

🐧 Joris Dev Machine – Linux Mint XFCE Setup

Deze handleiding installeert een volledige ontwikkel- en mediowerkplek op Linux Mint XFCE, geschikt voor de MacBook Pro 2011 (A1278).

📦 Wat wordt geïnstalleerd
🔧 Development

Git

GitHub Desktop

GitKraken

Visual Studio Code

Sublime Text

Geany

🎵 Media

Spotify

Strawberry (Winamp-achtige muziekspeler)

Audacious

VLC

Celluloid (mpv GUI)

Plex HTPC

🧮 Productiviteit

LibreOffice

Nextcloud Desktop

🔤 Fonts

Open Sans

Lato

Microsoft Core Fonts

Custom OTF fonts (Superclarendon, Kefa PressS, etc.)

🎬 Codecs

ubuntu-restricted-extras

mint-meta-codecs

ffmpeg

GStreamer plugins

🛠 Installatie-instructies
1️⃣ Download of maak het install script

Maak een bestand:

install-joris-dev.sh


Plak het install script in dit bestand.

2️⃣ Maak het script uitvoerbaar

Open terminal in de map waar het script staat:

chmod +x install-joris-dev.sh

3️⃣ (Optioneel) Voeg custom fonts toe

Maak een map naast het script:

custom-fonts/


Plaats daarin:

Superclarendon.otf
KefaPressS.otf


Linux kan OTF direct gebruiken.

4️⃣ Voer het script uit
./install-joris-dev.sh


Het script:

Update het systeem

Installeert alle APT packages

Voegt externe repositories toe

Installeert Flatpaks

Installeert media codecs

Installeert extra fonts

Installeert GitHub Desktop en GitKraken

5️⃣ Herstart

Na voltooiing:

sudo reboot

🔥 Aanbevolen extra (MacBook 2011 optimalisatie)

Installeer thermische optimalisatie:

sudo apt install tlp mbpfan
sudo systemctl enable tlp
sudo systemctl start tlp


Dit zorgt voor:

Betere batterijduur

Minder hitte

Stillere werking

🧪 Verifiëren

Controleer of alles correct geïnstalleerd is:

git --version
code --version
flatpak list


Start applicaties via het XFCE menu.

🧱 Optioneel: Snapshot maken (VM)

Als je dit in VMware test:

Maak een snapshot na succesvolle installatie

Noem deze: Mint-Joris-Base

Zo kun je altijd terugkeren naar een schone staat.

📁 Reproduceerbaarheid

Om later pakketten te exporteren:

dpkg --get-selections > packages.txt
flatpak list --app --columns=application > flatpaks.txt


Zo kun je deze setup op elke Mint-machine opnieuw uitrollen.

💭 Filosofie

Dit systeem is bedoeld als:

Dagelijkse ontwikkelmachine

Muziek- en mediacentrum

Lichtgewicht maar krachtig

Reproduceerbaar en onderhoudbaar

Geen museumstuk — maar een levend systeem.
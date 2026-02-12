📦 Desktop Bootstrap Script — Installatie Instructies

Dit script installeert een selectie van media-, dev- en systeempakketten op een Linux Mint / Ubuntu-gebaseerd systeem.
Het gebruikt officiële repositories waar mogelijk en LTS-bronnen voor stabiliteit.

🧭 Stap 1 — Terminal openen

Open een terminal:

Ctrl + Alt + T


of via menu → Terminal.

📂 Stap 2 — Naar Desktop of Downloads gaan

Als het scriptbestand daar staat, ga naar de juiste map.

Desktop:
cd ~/Desktop

Downloads:
cd ~/Downloads


Controleer of het bestand zichtbaar is:

ls


Je zou het script moeten zien, bijvoorbeeld:

bootstrap-desktop.sh

🔐 Stap 3 — Script uitvoerbaar maken
chmod +x bootstrap-desktop.sh

▶️ Stap 4 — Script uitvoeren
./bootstrap-desktop.sh


Je wordt gevraagd om je wachtwoord in te voeren voor sudo.

🧱 Wat dit script doet

Het script:

voegt i386 support toe (Steam/Wine compatibiliteit)

installeert media tools

installeert meerdere mediaplayers (test en verwijder later wat je niet wilt)

installeert Steam

installeert Lutris via officiële repo

installeert ClamAV + GUI (ClamTK)

installeert dev tools

installeert Node.js actuele LTS

configureert Flatpak + Flathub

laat VirtualBox / virt-manager uitgeschakeld (commentaar) voor VM-gebruik

🧪 Na installatie controleren
Node:
node -v
npm -v

Git:
git --version

Flatpak:
flatpak remotes

🧹 Optioneel — mediaplayers opruimen

Na testen kun je ongewenste spelers verwijderen:

sudo apt remove vlc
sudo apt remove haruna
sudo apt remove celluloid


Daarna:

sudo apt autoremove


Als je wilt, maak ik nog een tweede .md sectie met:

troubleshooting

VM-specifieke tips

rollback

minimal install profiel

Windows-dual-boot gebruikersnotities

Dan is je repo meteen echt public-klaar.
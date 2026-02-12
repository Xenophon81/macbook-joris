# Linux Mint Security Baseline — Desktop Hardening

Minimalistische maar degelijke security-baseline voor Linux Mint desktopgebruik.  
Geen overbodige “security theater”, enkel praktische bescherming met lage overhead.

---

# 🛡️ Overzicht

Deze baseline bevat:

- systeem updates
- firewall configuratie
- rootkit detectie
- malware scanning
- automatische security updates
- optionele brute-force bescherming
- permissie-hardening
- periodieke controles
- browser baseline

---

# 🔹 Stap 1 — Systeem volledig updaten

```bash
sudo apt update && sudo apt full-upgrade -y
sudo apt autoremove -y

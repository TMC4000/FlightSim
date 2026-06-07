#!/bin/bash

# Pi-Apps Funktionen einbinden (falls lokal getestet wird)
source colors 2>/dev/null

# 1. Status-Update an die Pi-Apps GUI senden
status_update "Entferne FlightGear Flight Simulator..."

# FlightGear und seine Komponenten inklusive Konfigurationsdateien löschen
apt purge flightgear flightgear-data flightgear-models -y || error "Fehler beim Entfernen von FlightGear."

# 2. Status-Update für Abhängigkeiten
status_update "Entferne Abhängigkeiten..."

# Abhängigkeiten und Joystick-Support entfernen
apt purge libboost-all-dev libopenscenegraph-dev liburiparser-dev libplib-dev joystick jstest-gtk -y || error "Fehler beim Entfernen der Abhängigkeiten."

# 3. Nicht mehr benötigte Systemabhängigkeiten aufräumen
status_update "Räume ungenutzte Pakete auf..."
apt autoremove --purge -y

# 4. Benutzerverzeichnisse aufräumen
status_update "Räume Benutzerkonfiguration auf..."
rm -rf ~/.fgfs 2>/dev/null
rm -f ~/flightgear-launcher.sh 2>/dev/null

# 5. Abschlussmeldung
status_update "FlightGear Flight Simulator wurde erfolgreich entfernt!"

echo "Deinstallation abgeschlossen. FlightGear und alle Komponenten wurden entfernt."

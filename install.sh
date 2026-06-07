#!/bin/bash

# Pi-Apps Funktionen einbinden (falls lokal getestet wird)
source colors 2>/dev/null

# 1. Status-Update an die Pi-Apps GUI senden
status_update "Aktualisiere Paketquellen..."

# Paketlisten aktualisieren
apt update || error "Fehler beim Aktualisieren der Paketquellen."

# 2. Status-Update für die FlightGear Installation
status_update "Installiere FlightGear Flight Simulator..."

# FlightGear und Abhängigkeiten installieren
apt install flightgear flightgear-data flightgear-models -y || error "Fehler bei der Installation von FlightGear."

# 3. Status-Update für zusätzliche Abhängigkeiten
status_update "Installiere zusätzliche Abhängigkeiten..."

# Weitere nützliche Pakete für die optimale Funktionalität auf dem RPi5
apt install libboost-all-dev libopenscenegraph-dev liburiparser-dev libplib-dev -y || error "Fehler bei der Installation von Abhängigkeiten."

# 4. Joystick/Controller-Unterstützung
status_update "Installiere Joystick-Unterstützung..."

apt install joystick jstest-gtk -y || error "Fehler bei der Installation der Joystick-Unterstützung."

# 5. Abschlussmeldung
status_update "FlightGear Flight Simulator wurde erfolgreich installiert!"

echo "Installation abgeschlossen. Starten Sie FlightGear mit: fgfs"

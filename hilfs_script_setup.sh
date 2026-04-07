#!/bin/bash

# Autor: Gian Catrina
# Erstellungsdatum: 31.03.2026
# Letztes Aenderungensdatum: 28.04.2026
# Beschreibung: Dieses Script installiert Ansible, und fuehrt das Playbook aus, damit automatisiert man die Installation von diversen Programmen

echo "========================================================================"
echo "Zuerst, wird der packet-manager erneuert, und ansible wird runtergeladen"
echo "========================================================================"

sudo apt update
sudo apt install ansible -y

echo "========================================================================"
echo "Gib den Pfad zum hosts.ini an, wenn du es runtergeladen hast, dann lasse leer fuer den Standardpfad 'playbook/inventory/hosts.ini'"
echo "========================================================================"
read hostspfad

if [ -z "$hostspfad" ]; then
    hostspfad="playbook/inventory/hosts.ini"
    echo "Es wird der Standardpfad verwendet"
fi

if [ ! -f "$hostspfad" ]; then
    echo "========================================================================"
    echo "FEHLER: Das hosts.ini '$hostspfad' existiert nicht, das Script wird abgebrochen"
    echo "========================================================================"
    exit 1
fi

echo "========================================================================"
echo "Gib den Pfad zum site.yml an, wenn du es runtergeladen hast, dann lasse leer fuer den Standardpfad 'playbook/site.yml'"
echo "========================================================================"
read sitepfad

if [ -z "$sitepfad" ]; then
    sitepfad="playbook/site.yml"
    echo "Es wird der Standardpfad verwendet"
fi

if [ ! -f "$sitepfad" ]; then
    echo "========================================================================"
    echo "FEHLER: Das site.yml '$sitepfad' existiert nicht, das Script wird abgebrochen"
    echo "========================================================================"
    exit 1
fi

echo "========================================================================"
echo "Jetzt wird gleich 'BECOME password' kommen, dort musst du dein sudo Passwort eingeben"
echo "========================================================================"

ansible-playbook -i $hostspfad $sitepfad -K

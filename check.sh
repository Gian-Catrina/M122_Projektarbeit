#!/bin/bash

# Autor: Gian Catrina
# Erstellungsdatum: 31.03.2026
# Letztes Aenderungensdatum: 28.04.2026
# Beschreibung: Dieses Script, ueberprueft ob Nmap installiert wurde, und somit auch, ob das Playbook erfolgreich durchgelaufen ist.

(crontab -l 2>/dev/null; echo "0 12 * * * /bin/bash /pfad/zu/deinem/check_nmap.sh") | crontab -

LOG="playbook.log"

if command -v nmap > /dev/null; then
    echo "Installation hat geklappt"
    echo "geklappt" >> $LOG
else
    echo "Hat nicht geklappt"
    echo "nicht geklappt" >> $LOG
fi
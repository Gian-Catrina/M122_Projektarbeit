#!/bin/bash

# Autor: Gian Catrina
# Erstellungsdatum: 31.03.2026
# Letztes Aenderungensdatum: 28.04.2026
# Beschreibung: Dieses Script, ueberprueft ob Nmap installiert wurde, und somit auch, ob das Playbook erfolgreich durchgelaufen ist.

echo "========================================================================"
echo "Gib den Absoluten Pfad zum check.sh an. Wenn du es runtergeladen hast, ist es wahrscheinlich /home/'deinusername'/M122_Projektarbeit/check.sh"
echo "========================================================================"
read checkpfad

(crontab -l 2>/dev/null; echo "0 12 * * * /bin/bash $checkpfad") | crontab -

echo "========================================================================"
echo "Gib den Absoluten Pfad zum Logfile an, genau den gleichen wie oben, aber anstatt /check.sh einfach /playbook.log"
echo "========================================================================"
read logpfad

LOG="$logpfad"

if command -v nmap > /dev/null; then
    echo "Installation hat geklappt"
    echo "geklappt" >> $LOG
else
    echo "Hat nicht geklappt"
    echo "nicht geklappt" >> $LOG
fi
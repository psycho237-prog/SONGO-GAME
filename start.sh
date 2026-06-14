#!/bin/bash
echo "==================================================="
echo "       LANCEMENT DU JEU SONGO (MULTIJOUEUR)"
echo "==================================================="
echo ""

# Tentative de récupération de l'IP locale (Linux / macOS)
if command -v ip > /dev/null; then
    IP=$(ip route get 1.1.1.1 | awk '{print $7}' | head -n 1)
elif command -v ifconfig > /dev/null; then
    IP=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' | head -n 1)
else
    IP="localhost"
fi

echo "--- POUR VOUS (Sur ce PC) ---"
echo "Ouvrez le lien : http://localhost:8080"
echo ""
echo "--- POUR JOUER AVEC UN AMI (Sur le même réseau Wi-Fi) ---"
echo "Demandez-lui d'ouvrir ce lien sur son téléphone/PC :"
echo "http://$IP:8080"
echo ""
echo "Ne fermez pas ce terminal pendant la partie !"
echo "==================================================="

# Lancer le navigateur par défaut selon l'OS (Linux / macOS)
if command -v xdg-open > /dev/null; then
    xdg-open http://localhost:8080 &
elif command -v open > /dev/null; then
    open http://localhost:8080 &
fi

php -S 0.0.0.0:8080

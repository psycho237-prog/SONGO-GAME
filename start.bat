@echo off
setlocal enabledelayedexpansion

echo ===================================================
echo        LANCEMENT DU JEU SONGO (MULTIJOUEUR)
echo ===================================================
echo.

:: Recherche automatique de l'adresse IP locale
for /f "tokens=2 delims=:" %%F in ('ipconfig ^| findstr /c:"IPv4"') do set IP=%%F
if defined IP (
    set IP=%IP: =%
) else (
    set IP=localhost
)

echo --- POUR VOUS (Sur ce PC) ---
echo Lien : http://localhost:8080
echo.
echo --- POUR JOUER AVEC UN AMI (Sur le reseau Wi-Fi) ---
echo Demandez-lui d'ouvrir ce lien sur son telephone/PC :
echo http://%IP%:8080
echo.
echo (Si une fenetre du Pare-feu apparait, cliquez sur "Autoriser")
echo.
echo Ne fermez pas cette fenetre noire pendant la partie !
echo ===================================================

start http://localhost:8080
php -S 0.0.0.0:8080
pause

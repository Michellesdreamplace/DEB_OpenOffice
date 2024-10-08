#!/bin/bash
OOURL='https://www.dropbox.com/scl/fi/0w0wdtt1mfs6etccxb5gc/Apache_OpenOffice_4.1.15_Linux_x86-64_install-deb_de.tar.gz?rlkey=ls42daqdrr7aahczvoyej36gv&st=l7325yrf&dl=1'
OODOWNNAME='Apache_OpenOffice_4.1.15_Linux_x86-64_install-deb_de.tar.gz?rlkey=ls42daqdrr7aahczvoyej36gv&st=l7325yrf&dl=1'
OONAME='Apache_OpenOffice_4.1.15_Linux_x86-64_install-deb_de.tar.gz'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGREY='\033[0;37m'
NORMAL='\033[0;39m'
BENUTZER=$USER
HOMEVERZEICHNIS=$HOME
MYSHELL=$SHELL
echo "$CYAN Hallo $BENUTZER"
echo "$CYAN Dein Home-Verzeichnis: $HOMEVERZEICHNIS"
echo "$CYAN Deine Shell: $MYSHELL"
#
echo "$CYAN "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++             lade OpenOffice herunter             +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL "
echo "$GREEN ************************************************************"
echo "    installiere wget (falls nicht vorhanden) ..."
echo "    ... um Dateien von https herunterladen zu können ..."
echo " ... $NORMAL"
sudo apt install -y wget apt-transport-https
echo "$GREEN ************************************************************"
echo "    installiere tar (falls nicht vorhanden) ..."
echo "    ... um Dateien entpacken zu können ..."
echo " ... $NORMAL"
sudo apt install tar -y
echo "$GREEN ************************************************************"
echo "    lade OpenOffice herunter ..."
echo " ... $NORMAL"
wget -P $HOMEVERZEICHNIS/Downloads/OpenOffice $OOURL
echo "$GREEN ************************************************************"
#
sudo cp $HOMEVERZEICHNIS/Downloads/OpenOffice/$OODOWNNAME $HOMEVERZEICHNIS/Downloads/OpenOffice/$OONAME
sudo rm $HOMEVERZEICHNIS/Downloads/OpenOffice/$OODOWNNAME
#
echo "    entpacke OpenOffice ..."
echo " ... $NORMAL"
sudo tar -xzf $HOMEVERZEICHNIS/Downloads/OpenOffice/$OONAME -C $HOMEVERZEICHNIS/Downloads/OpenOffice/
echo "$GREEN ************************************************************"
#
echo "$CYAN "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++           Deinstalliere LibreOffice ...          +++++"
echo "+++++  da es sonst zu Konflikten mit OpenOffice kommt  +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL "
sudo apt purge libreoffice* 
#
#
echo "$CYAN "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++             installiere OpenOffice               +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL "
echo "$GREEN ************************************************************"
echo "    installiere OpenOffice ..."
echo " ... $NORMAL"
sudo dpkg -i $HOMEVERZEICHNIS/Downloads/OpenOffice/de/DEBS/*.deb
echo "$GREEN ************************************************************"
echo "    installiere OpenOffice Desktop-Integration ..."
echo " ... $NORMAL"
sudo dpkg -i $HOMEVERZEICHNIS/Downloads/OpenOffice/de/DEBS/desktop-integration/*.deb
echo "$GREEN ************************************************************"
#
#
echo "$CYAN "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++            aktuallisieren & aufräumen            +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL "
echo "$GREEN ************************************************************"
echo "    lese Paketdatenbank (Repository-Index) neu ein"
echo " ... $NORMAL"
sudo apt update
echo "$GREEN ************************************************************"
echo "    Installierte Pakete werden auf eine neuere Version aktualisiert ..."
echo "    ... um geänderte Abhängigkeiten zu erfüllen,"
echo "    werden ge­ge­be­nen­falls auch neue Pakete installiert ..."
echo " ... $NORMAL"
sudo apt upgrade -y
echo "$GREEN ************************************************************"
echo "    bereinige System von nutzlosen Paketen ..."
echo "    deinstalliere alle automatisch installierten Pakete,"
echo "    die keine Abhängigkeiten mehr zu anderen Paketen haben"
echo "    und deshalb nicht mehr benötigt werden ..."
echo " ... $NORMAL"
sudo apt autoremove -y
echo "$GREEN ************************************************************"
echo "    Download-Verzeichnis aufräumen ..."
echo " ... $NORMAL"
sudo rm -r $HOMEVERZEICHNIS/Downloads/OpenOffice
echo "$GREEN ************************************************************"
echo " "
echo "   Fertig ..."
echo " "
#
echo "$CYAN "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+++++                                                  +++++"
echo "+++++             viel Spaß mit OpenOffice             +++++"
echo "+++++                                                  +++++"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "$NORMAL "
#


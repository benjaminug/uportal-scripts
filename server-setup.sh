#!bin/bash

#Set the PASSWORD
#Once in a while Updated the version numbers to the latest stable versions

apt-get update
apt-get install imagemagick
apt-get install git
apt-get -y install apache2
apt-get -y install php5 libapache2-mod-php5
/etc/init.d/apache2 restart

echo mysql-server-5.1 mysql-server/root_password password PASSWORD | debconf-set-selections
echo mysql-server-5.1 mysql-server/root_password_again password PASSWORD | debconf-set-selections
apt-get install -y mysql-server

echo -e "////////////////////////////////////////////////////"
echo -e "// Server Setup Completed Successfully "
echo -e "////////////////////////////////////////////////////"
while true; do
    read -p "press enter to exit"
    case $yn in
        * ) exit;;
    esac
done
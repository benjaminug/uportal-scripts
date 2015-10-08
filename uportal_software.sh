#!bin/bash

#Create a database with a username and password
#Set root pwd in mysql-create.sh
sh mysql-create.sh thedatabase theusername thepassword;

# Directories
##########################################################
httpDir="/var/www/html"
rootDir="uportal-root" #leave blank to set http directory as root directory.
##########################################################

# Site
##########################################################
siteName="uPortal"
siteSlogan="uPortal"
siteLocale="gb"
siteProfile="uportal"
##########################################################

# Database
##########################################################
dbHost="localhost"
dbName="thedatabase"
dbUser="theusername"
dbPassword="thepassword"
##########################################################

# Admin
##########################################################
AdminUsername="portaladmin"
AdminPassword="pass4260"
adminEmail="me@lutaaya.net"
##########################################################

# Make the uPortal Instance
##########################################################
 
cd $httpDir;

git clone --branch 7.x-1.x-dev http://git.drupal.org/sandbox/benjaminug/2535410.git make2;

drush make --no-cache --prepare-install make/build-uportal.make $rootDir;

cd $httpDir/$rootDir;

# Install core
##########################################################
drush si uportal --account-mail=$adminEmail --account-name=$AdminUsername --account-pass=$AdminPassword --site-name=$siteName --site-mail=$adminEmail --locale=$siteLocale --db-url=mysql://$dbUser:$dbPassword@$dbHost/$dbName -y;

# Pre configure settings
##########################################################
# disable user pictures
drush vset -y user_pictures 0;
# allow only admins to register users
drush vset -y user_register 0;
# set site slogan
drush vset -y site_slogan $siteSlogan;

echo -e "////////////////////////////////////////////////////"
echo -e "// uPortal Instance setup Completed"
echo -e "////////////////////////////////////////////////////"
while true; do
    read -p "press enter to exit"
    case $yn in
        * ) exit;;
    esac
done

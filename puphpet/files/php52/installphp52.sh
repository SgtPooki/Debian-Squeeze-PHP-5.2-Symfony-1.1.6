#!/bin/bash
# retrieved from http://ubuntuforums.org/showthread.php?t=1566808
# modified by Russell Dempsey <rdempsey@nerdery.com>
sudo echo "deb http://archive.debian.org/debian lenny main contrib non-free" >> /etc/apt/sources.list
sudo cp /var/www/puphpet/files/php52/lenny /etc/apt/preferences.d/
sudo apt-get remove -y --purge php5\*
sudo apt-get update
sudo apt-get clean
sudo apt-get -y install libapache2-mod-php5 php5 php5-cli php5-common php5-curl php5-dev php5-gd php5-mcrypt php5-mysql php5-xsl

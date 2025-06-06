#!/usr/bin/env bash
#Install dependencies
sudo apt install liblua5.3-dev lua5.3 build-essential cmake

#Clone and install lsyncd
cd ~/Documents
git clone https://github.com/axkibe/lsyncd.git
cd lsyncd
cmake .
make
sudo make install

#Go back to the gitted folder
cd $OLDPWD
#Copy lsyncd rotation config into /etc/logrotate.d/
sudo cp lsyncd /etc/logrotate.d/
sudo logrotate /etc/logrotate.conf

#Copy lsyncd.conf  into /etc/
sudo cp lsyncd.conf /etc/

#Copy lsyncd.service into /etc/systemd/system/
sudo cp lsyncd.service /etc/systemd/system/
#Enable lsyncd service
sudo systemctl enable lsyncd.service
sudo mkdir /var/log/lsyncd
#Start lsyncd service
sudo systemctl start lsyncd.service

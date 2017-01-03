#!/bin/bash


#provision runs with root

apt-get -y update

# apt-get using dpkg (debian package) behind the scenes
# here dpk -s checks if npm is installed

# if not installed (dpg will return a non-0 exit code)
# when non-zero code is encounterd, it will hit the || block and install it
# use /dev/null to remove dkg output
dpkg -s nodejs &>/dev/null || {
	apt-get install -y curl

	curl -sL https://deb.nodesource.com/setup_7.x | bash -
	apt-get install -y nodejs

	# create alias from nodejs to node
	ln -s /usr/bin/nodejs /usr/bin/node
	apt-get install -y build-essential
}

command -v yo &>/dev/null || {
	npm install -g yo generator-hubot
}

pkg -s libexpat1-dev &>/dev/null || {
	apt-get install -y libexpat1-dev	
}

# copy hubot upstart file to /etc/init
cp /vagrant/upstart/myhubot.conf /etc/init/myhubot.conf
machine=$1
# upstart expectes the override file must match name of conf file myhubut
cp /vagrant/upstart/myhubot.$machine.override /etc/init/myhubot.override

# -u user -i simulate initial login (set up vagrant env including HOME env), then run npm install
run_as_user=$2
sudo -u $run_as_user -i sh -c 'cd /vagrant/myhubot; npm install'

# restart our hubot service - restart or start it
service myhubot restart
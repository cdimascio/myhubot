#!/bin/bash


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

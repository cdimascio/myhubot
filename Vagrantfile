Vagrant.configure("2") do |config|
  
  
  config.vm.provision "shell", path: "provision.sh"

  excludes = [".git/", "myhubot/node_modules"]
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: excludes, rsync_excludes: excludes

  config.vm.define "dev" do |dev|
  	dev.vm.box = "ubuntu/trusty64"
	dev.vm.hostname = "hubot-dev"
  end

  config.vm.define "prod" do |prod|
  	prod.vm.box = "dummy"
  	prod.vm.provider "aws" do |aws, override|
  		aws.region_config "us-east-1", :ami => "ami-a95044be"
  		aws.region = "us-east-1"

  		aws.tags = {
  			'Name' => Hubot
  		}

  		override.ssh.username = "ubuntu"
  		aws.keypair_name = "dimascio-aws-personal"
  		override.ssh.private_key_path = "~/Downloads/dimascio-aws-personal.pem"

  		aws.access_key_id = "YOUR KEY"
  		aws.secret_access_key = "YOUR KEY"
  	end
  end
end

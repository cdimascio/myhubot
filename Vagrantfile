Vagrant.configure("2") do |config|
  
  
  config.vm.provision "shell", path: "provision.sh"

  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [".git/", "myhubot/node_modules"]

  config.vm.define "dev" do |dev|
  	dev.vm.box = "ubuntu/trusty64"
	dev.vm.hostname = "hubot-dev"
  end

  config.vm.define "prod" do |prod|
  	
  end
end

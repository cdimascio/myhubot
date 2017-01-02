Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "hubot-dev"
  config.vm.provision "shell", path: "provision.sh"

  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [".git/", "myhubot/node_modules"]
end

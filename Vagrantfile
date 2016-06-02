Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.box_url = "https://atlas.hashicorp.com/bento/boxes/centos-7.2"

  config.vm.provider "virtualbox" do |vm|
    vm.gui = false
    vm.customize ["modifyvm", :id, "--ostype", "RedHat_64"]
  end

  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network :forwarded_port,guest: 80,host: 58080
end

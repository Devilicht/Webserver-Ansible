Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  
  config.vm.provider "virtualbox" do |vb|
  end
  
  config.vm.define "web1" do |web1|
    web1.vm.hostname = "web1"
    web1.vm.network "private_network", ip: "192.168.60.101"
    web1.vm.network "forwarded_port", guest: 8082, host: 8082
    web1.vm.provision "shell", path: "provision.sh"
  end

  config.vm.define "web2" do |web2|
    web2.vm.hostname = "web2"
    web2.vm.network "private_network", ip: "192.168.60.102"
    web2.vm.network "forwarded_port", guest: 8081, host: 8081
    web2.vm.provision "shell", path: "provision.sh"
  end
end

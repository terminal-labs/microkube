# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

cluster = {
  "master" => { :ip => "192.168.33.10", :cpus => 1, :mem => 2048, :type => "master", :script => "scripts/master.sh" },
   "node0" => { :ip => "192.168.33.11", :cpus => 1, :mem => 2048, :type => "node", :script => "scripts/nodes.sh" }
#  "node1" => { :ip => "192.168.33.11", :cpus => 1, :mem => 2048, :type => "node", :script => "scripts/nodes.sh" },
#  "node2" => { :ip => "192.168.33.11", :cpus => 1, :mem => 2048, :type => "node", :script => "scripts/nodes.sh" }
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  cluster.each_with_index do |(hostname, info), index|
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|
        config.vm.box = "debian/jessie64"
        override.vm.network :private_network, ip: "#{info[:ip]}"
        override.vm.hostname = hostname
        vb.name = hostname
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus], "--hwvirtex", "on"]
        override.vm.provision "shell", path: "scripts/before-reboot-common.sh"
        override.vm.provision :reload
        override.vm.provision "shell", path: "scripts/after-reboot-common.sh"
        if info[:type] == "master"
          override.vm.provision "shell", path: "scripts/after-reboot-master.sh"
          override.vm.network "forwarded_port", guest: 8001, host: 8001
        end
        #config.vm.provision "shell", path: "#{info[:script]}"
      end
    end
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # config.vm.boot_mode = :gui
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # ip address
  config.vm.network :hostonly, "33.33.33.10"

  # forward this ports from 33.33.33.10 to 127.0.0.1
  config.vm.forward_port 80, 8080
  config.vm.forward_port 5432, 5432
  config.vm.forward_port 3306, 3306
  config.vm.forward_port 27017, 27017
  config.vm.forward_port 3000, 3000
  config.vm.forward_port 4567, 4567
  config.vm.forward_port 7777, 7777
  config.vm.forward_port 11211, 11211
  config.vm.forward_port 3312, 3312

  # Vagrant apply the recipes on boot
  config.vm.provision :chef_solo do |chef|
    # Equivalent to config.rb
    chef.cookbooks_path = "cookbooks"

    # TODO(mariozaizar) try to get this with File.read(attributes.json) or something.
    # Equivalent to attributes.json
    # chef.json = { "foo":"bar" }

    chef.add_recipe "system"
    chef.add_recipe "system::pimp"
    chef.add_recipe "databases::postgres"  # 5432
    chef.add_recipe "databases::mysql"     # 3306
    chef.add_recipe "databases::mongodb"   # 27017
    chef.add_recipe "frameworks::rails"    # 3000
    chef.add_recipe "frameworks::sinatra"  # 4567
    chef.add_recipe "jenkins"              # 7777
    chef.add_recipe "memcached"            # 11211
    chef.add_recipe "sphinx"               # 3312
  end

  # or,
  # User apply the recipes manually: $ sudo chef-solo --config config.rb -j attributes.json;
  # config.vm.share_folder "v-data", "/home/vagrant/install", "."
end

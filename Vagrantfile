Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # ip address
  config.vm.network :hostonly, "33.33.33.10"

  # forward from 33.33.33.10 to 127.0.0.1
  config.vm.forward_port 80, 8080   # http
  config.vm.forward_port 3000, 3000 # rails
  config.vm.forward_port 5432, 5432 # postgres

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "system"
    chef.add_recipe "postgres"
    chef.add_recipe "rails"
  end
end

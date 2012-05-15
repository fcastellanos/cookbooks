require "virtualbox"

remote_file "vagrant_1.0.2" do
  source "http://files.vagrantup.com/packages/41445466ee4d376601fd8d0c6a5e3af61d32f131/vagrant_1.0.2_x86_64.deb"
  path "/var/cache/apt/archives/vagrant_1.0.2_x86_64.deb"
  action :create_if_missing
  mode 0755
  backup false
  owner "root"
  group "root"
end

package "vagrant_1.0.2" do
  source "/var/cache/apt/archives/vagrant_1.0.2_x86_64.deb"
  provider Chef::Provider::Package::Dpkg
  action :install
end

link "/usr/bin/vagrant" do
  to "/opt/vagrant/bin/vagrant"
end

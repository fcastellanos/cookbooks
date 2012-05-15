remote_file "virtualbox-4.1" do
  source "http://download.virtualbox.org/virtualbox/4.1.10/virtualbox-4.1_4.1.10-76795~Ubuntu~lucid_amd64.deb"
  path "/var/cache/apt/archives/virtualbox-4.1_4.1.10-76795~Ubuntu~lucid_amd64.deb"
  action :create_if_missing
  mode 0755
  backup false
  owner "root"
  group "root"
end

package "virtualbox-4.1" do
  source "/var/cache/apt/archives/virtualbox-4.1_4.1.10-76795~Ubuntu~lucid_amd64.deb"
  provider Chef::Provider::Package::Dpkg
  action :install
end

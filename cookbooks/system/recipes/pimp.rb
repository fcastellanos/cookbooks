package "git-core"

# TODO(mariozaizar) change this for rvm, or rbenv
package "ruby1.9.3"
package "rubygems"
gem_package "rake"

# Pimp your terminal (aka dotfiles)
git "/home/vagrant/dotfiles" do
  repository "git://github.com/mariozaizar/dotfiles.git"
  reference "master"
  user "vagrant"
  group "vagrant"
  action :sync
end

# Install dotfiles without any personalization
#execute "Installing dotfiles" do
#  command "rake install:linux"
#  cwd "/home/vagrant/dotfiles/"
#  user "vagrant"
#  group "vagrant"
#end

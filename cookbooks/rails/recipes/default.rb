# package "ruby1.9.3"   # Ruby 1.9.3
# package "rubygems"    # Rubygems 1.8.15
# gem_package "rake"    # Rake 0.9.2.2
# gem_package "rails"   # Rails 3.2.3

# or, use rbenv to install ruby, rubygems, rake, and rails
git '/home/vagrant/.rbenv' do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :sync
  user "vagrant"
  group "vagrant"
end

# rbenv-install
git '/home/vagrant/.ruby-build' do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :sync
  user "vagrant"
  group "vagrant"
end

script "rbenv" do
  interpreter "bash"
  user "vagrant"
  code <<-bash
    if [ ! -e /tmp/rbenv.lock ]; then
      # Enable rbenv
      echo 'export PATH=$PATH:/home/vagrant/.rbenv/bin/'    >> ~/.bashrc;
      echo 'eval "$(rbenv init -)"'                         >> ~/.bashrc;
      source ~/.bashrc;

      # Install rbenv-install
      cd /home/vagrant/.ruby-build/;
      ./install.sh;

      # Install ruby 1.9.3
      rbenv-install 1.9.3-p125;
      rbenv rehash;

      touch /tmp/rbenv.lock;
    fi
  bash
end

# Proyect
directory '/home/vagrant/Proyectos' do
  owner "vagrant"
  group "vagrant"
  action :create
  recursive true
  mode 0755
end

execute "echo '1.9.3-p125' > /home/vagrant/Proyectos/.rbenv-version"
execute "gem install bundler"
execute "gem install rails"

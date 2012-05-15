script "fixing current user locales" do
  interpreter "bash"
  code <<-bash
    if cat ~/.bashrc | grep 'LC_ALL' > /dev/null; then
      echo "Set en_US as default LOCALE";
    else
      echo ''                              >> ~/.bashrc;
      echo '# Set en_US as default LOCALE' >> ~/.bashrc;
      echo 'export LANGUAGE=en_US.UTF-8'   >> ~/.bashrc;
      echo 'export LANG=en_US.UTF-8'       >> ~/.bashrc;
      echo 'export LC_ALL=en_US.UTF-8'     >> ~/.bashrc;
    fi
  bash
end

script "fixing system locales" do
  interpreter "bash"
  user "root"
  code <<-bash
    if cat /etc/bash.bashrc | grep 'LC_ALL' > /dev/null; then
      echo "Set en_US as default LOCALE";
    else
      echo ''                              >> /etc/bash.bashrc;
      echo '# Set en_US as default LOCALE' >> /etc/bash.bashrc;
      echo 'export LANGUAGE=en_US.UTF-8'   >> /etc/bash.bashrc;
      echo 'export LANG=en_US.UTF-8'       >> /etc/bash.bashrc;
      echo 'export LC_ALL=en_US.UTF-8'     >> /etc/bash.bashrc;

      locale-gen en_US.UTF-8;
      dpkg-reconfigure locales;
    fi
  bash
end

# Update APT
execute "apt-get update"
execute "apt-get --fix-broken -y install"
execute "apt-get autoremove"
execute "updatedb"

# Utilities
package "build-essential" # make, gcc, headers
package "git-core" # 1.7.9.5
package "vim" # 7.3
package "patch"
package "curl"
package "wget"
package "htop"

# include_recipe "virtualization::virtualbox"
# include_recipe "virtualization::vagrant"

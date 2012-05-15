# Install postgres
package "postgresql"
package "postgresql-client"
package "postgresql-contrib"

execute "export PATH='$PATH:/usr/lib/postgresql/9.1/bin/'"
# execute "export PGDATA='/usr/local/pgsql/data'"

# Configure server
cookbook_file "/etc/postgresql/9.1/main/postgresql.conf" do
  mode "0644"
end

# Enable remote connections
cookbook_file "/etc/postgresql/9.1/main/pg_hba.conf" do
  mode "0644"
end

# Restart
service "postgresql" do
  action :restart
end

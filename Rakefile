require 'rake'

desc "cookbooks.tar.gz"
task :cookbooks do
  system %Q{tar -czf cookbooks_#{Time.now.strftime("%Y%m%d")}.tar.gz cookbooks/}
  system %Q{ls -lh}
end

desc "billfloat64.box"
task :package do
  system %Q{vagrant package}
  system %Q{mv package.box package_#{Time.now.strftime("%Y%m%d")}.box}
  system %Q{ls -lh}
end

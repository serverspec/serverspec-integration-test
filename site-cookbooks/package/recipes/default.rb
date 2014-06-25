case node['platform_family']
when 'rhel', 'fedora'
  include_recipe 'yum'
  php_package = 'php'

  package('bind-utils') { action :install }
when 'debian'
  include_recipe 'apt'
  php_package = 'php5'
end

package 'ethtool' do
  action :install
end

package 'gawk' do
  action :install
end

package 'postfix' do
  action :install
end

package php_package do
  action :install
end

package 'memcached' do
  action :install
end

service 'memcached' do
  action [ :enable, :start ]
end

package 'dnsmasq' do
  action :install
end

service 'dnsmasq' do
  action [ :enable, :start ]
end

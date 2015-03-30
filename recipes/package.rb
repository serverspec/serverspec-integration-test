case node[:platform]
when 'redhat', 'fedora'
  php_package = 'php'

  package('bind-utils')
  package('net-tools')
when 'debian', 'ubuntu'
  execute 'apt-get update'
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

if node[:virtualization][:system] != 'docker'
  package 'dnsmasq' do
    action :install
  end

  service 'dnsmasq' do
    action [ :enable, :start ]
  end
end

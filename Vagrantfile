VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest

  config.vm.provision 'chef_solo' do |chef|
    chef.add_recipe 'hosts'
    chef.add_recipe 'file'
    chef.add_recipe 'cron'
    chef.add_recipe 'selinux::disabled'
    chef.add_recipe 'package'
    chef.add_recipe 'alias'
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box               = 'AndrewDryga/digital-ocean'
    provider.token                = ENV['DIGITALOCEAN_ACCESS_TOKEN']
    provider.region               = 'Singapore 1'
    provider.size                 = '512MB'
    provider.ca_path              =
      '/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt'

    if ENV['WERCKER'] == 'true'
      provider.ssh_key_name = "wercker-#{ENV['WERCKER_GIT_REPOSITORY']}"
    else
      provider.ssh_key_name = 'local'
    end
  end

  config.vm.define :centos65 do |c|
    c.vm.box = 'chef/centos-6.5'
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'CentOS 6.5 x64'
    end
    c.vm.hostname  = 'centos65'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
  end

  config.vm.define :ubuntu1404 do |c|
    c.vm.box = 'chef/ubuntu-14.04'
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'Ubuntu 14.04 x64'
    end
    c.vm.hostname  = 'ubuntu1404'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
  end
end

Vagrant.configure('2') do |config|
  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box               = 'digital_ocean'
    override.vm.box_url           = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'
    provider.token                = ENV['DIGITALOCEAN_ACCESS_TOKEN']
    provider.region               = 'sgp1'
    provider.size                 = '512MB'
    if ENV['WERCKER'] == 'true'
      provider.ssh_key_name = "wercker-#{ENV['WERCKER_GIT_REPOSITORY']}"
    else
      provider.ssh_key_name = 'local'
    end
  end

  config.vm.define :centos65 do |c|
    c.vm.box = 'chef/centos-6.5'
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'centos-6-5-x64'
    end
    c.vm.hostname  = 'centos65'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
  end

  config.vm.define :centos70 do |c|
    c.vm.box = "chef/centos-7.0"
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'centos-7-0-x64'
    end
    c.vm.hostname  = 'centos70'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
  end

  config.vm.define :ubuntu1404 do |c|
    c.vm.box = 'chef/ubuntu-14.04'
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'ubuntu-14-04-x64'
    end
    c.vm.hostname  = 'ubuntu1404'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
  end

  config.vm.define :freebsd do |c|
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'freebsd-10-1-x64'
    end
    c.ssh.username = 'freebsd'
    c.ssh.shell = '/bin/sh'
    c.vm.hostname  = 'freebsd'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
    c.vm.synced_folder '.', '/vagrant', disabled: true
  end

  config.vm.define 'coreos' do |c|
    c.ssh.username = 'core'
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = 'coreos-stable'
      provider.setup = false

    end
    c.vm.hostname  = 'coreos'
    c.vm.hostname += "-#{ENV['WERCKER_BUILD_ID']}" if ENV['WERCKER_BUILD_ID']
    c.vm.provision :shell do |shell|
      shell.path = 'coreos-provision.sh'
    end
  end
end

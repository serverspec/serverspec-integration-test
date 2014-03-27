VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end

  config.vm.define :centos65 do |c|
    c.vm.box = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
  end

  config.vm.define :ubuntu1310 do |c|
    c.vm.box = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box"
  end

end

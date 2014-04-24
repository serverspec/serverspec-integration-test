VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "hosts"
    chef.add_recipe "file"
  end

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = "~/.ssh/id_rsa"
    override.vm.box               = "AndrewDryga/digital-ocean"
    provider.client_id            = ENV["DIGITALOCEAN_CLIENT_ID"]
    provider.api_key              = ENV["DIGITALOCEAN_API_KEY"]
    provider.region               = "San Francisco 1"
    provider.size                 = "512MB"
    provider.ca_path              =
      "/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt"

    if ENV['WERCKER'] == "true"
      provider.ssh_key_name = "wercker-#{ENV['WERCKER_GIT_REPOSITORY']}"
    else
      provider.ssh_key_name = "local"
    end
  end

  config.vm.define :centos65 do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = "CentOS 6.4 x64"
    end
    c.vm.hostname = "centos65-#{ENV['WERCKER_BUILD_ID']}"
  end

  config.vm.define :ubuntu1310 do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-13.10_chef-provisionerless.box"
    c.vm.provider :digital_ocean do |provider, override|
      provider.image = "Ubuntu 13.10 x64"
    end
    c.vm.hostname = "ubuntu1310-#{ENV['WERCKER_BUILD_ID']}"
  end

  config.vm.define :debian74 do |c|
    c.vm.box = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_debian-7.4_chef-provisionerless.box"
  end

end

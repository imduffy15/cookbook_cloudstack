# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

unless Vagrant.has_plugin?('vagrant-omnibus')
  raise 'vagrant-omnibus is not installed!'
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'cloudstack-berkshelf'

  config.vm.box = 'chef/centos-6.5'

  config.omnibus.chef_version = :latest

  # Port forward Tomcat
  config.vm.network 'forwarded_port', guest: 8080, host: 8080

  config.vm.network :private_network, :auto_config => true, :ip => '192.168.56.5'

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
    config.cache.auto_detect = true
    config.omnibus.cache_packages = true
  end

  config.berkshelf.berksfile_path = './Berksfile'
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks']

    chef.run_list = [
        'recipe[nat-router]',
        'recipe[cloudstack::management-server]'
    ]

    chef.arguments = '-l debug'

    config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '2048']
    end

  end
end

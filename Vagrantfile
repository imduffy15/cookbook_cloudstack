# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

unless Vagrant.has_plugin?("vagrant-omnibus")
  raise "vagrant-omnibus is not installed!"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "cloudstack-berkshelf"

  config.vm.box = "chef/centos-6.5"

  config.vm.network :private_network, type: "dhcp"

  config.omnibus.chef_version = :latest

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.auto_detect = true
    config.omnibus.cache_packages = true
  end

  config.berkshelf.berksfile_path = "./Berksfile"
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]

    chef.run_list = [
        "recipe[cloudstack::default]"
    ]

    chef.json = {
        "cloudstack" => {
            "systemvms" => [
                {
                    "id" => 1,
                    "hypervisor" => "xenserver",
                    "url" => "http://10.0.2.2:8000/systemvmtemplate-xen.vhd.bz2",
                    "name" => "routing-1"
                },
                {
                    "id" => 5,
                    "hypervisor" => "xenserver",
                    "url" => "http://10.0.2.2:8000/ttylinux_pv.vhd",
                    "name" => "tiny Linux"
                }
            ],
            "storage" => {
                "temporary" => "/tmp/vagrant-cache/cloudstack"
            }
        }
    }
  end
end

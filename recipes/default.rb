#
# Cookbook Name:: cloudstack
# Recipe:: default
#

cookbook_file "cloud-install-sys-tmplt" do
	action :create_if_missing
	mode 0755
	path "/usr/bin/cloud-install-sys-tmplt"
end

cookbook_file "createtmplt.sh" do
	action :create_if_missing
	mode 0755
	path "/usr/bin/createtmplt.sh"
end

directory "/exports/secondary" do
	action :create
	mode 0644
	recursive true
end

execute "cloud-install-sys-tmplt -m ~/ -u http://download.cloud.com/templates/4.3/systemvm64template-2014-01-14-master-xen.vhd.bz2 -h xenserver -t 1" do
end

include_recipe "mysql::client"

include_recipe "co-nfs::server"
include_recipe "co-nfs::exports"

include_recipe "nat-router"
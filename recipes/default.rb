#
# Cookbook Name:: cloudstack
# Recipe:: default
#

cookbook_file "cloud-install-sys-tmplt" do
	action :create_if_missing
	mode 0755
	path "/tmp/cloud-install-sys-tmplt"
end

cookbook_file "createtmplt.sh" do
	action :create_if_missing
	mode 0755
	path "/tmp/createtmplt.sh"
end

directory "#{node["cloudstack"]["storage"]["secondary"]}" do
	action :create
	mode 0755
	recursive true
end

node["cloudstack"]["systemvms"].each do |systemvm|
  execute "./cloud-install-sys-tmplt -m #{node["cloudstack"]["storage"]["secondary"]} -u #{systemvm['url']} -h #{systemvm["hypervisor"]} -t #{systemvm["id"]}" do
    cwd "/tmp"
    not_if { ::File.directory?("#{node["cloudstack"]["storage"]["secondary"]}/#{systemvm["id"]}") }
  end
end

include_recipe "mysql::client"
include_recipe "mysql::server"

include_recipe "co-nfs::server"
include_recipe "co-nfs::exports"

include_recipe "nat-router"

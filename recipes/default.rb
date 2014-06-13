#
# Cookbook Name:: cloudstack
# Recipe:: default
#

node["cloudstack"]["storage"].each_pair do |index, path|
  directory "#{path}" do
    action :create
    mode 0755
    recursive true
  end
end

cookbook_file "cloud-install-sys-tmplt" do
  action :create_if_missing
  mode 0755
  path "#{node["cloudstack"]["storage"]["temporary"]}/cloud-install-sys-tmplt"
end

cookbook_file "createtmplt.sh" do
  action :create_if_missing
  mode 0755
  path "#{node["cloudstack"]["storage"]["temporary"]}/createtmplt.sh"
end

node["cloudstack"]["systemvms"].each do |systemvm|

  filename = "#{systemvm['url']}".split('/').last

  remote_file "#{node["cloudstack"]["storage"]["temporary"]}/#{filename}" do
    action :create_if_missing
    source "#{systemvm['url']}"
  end

  execute "./cloud-install-sys-tmplt -m #{node["cloudstack"]["storage"]["secondary"]} -n #{systemvm["name"]} -f #{filename} -h #{systemvm["hypervisor"]} -t #{systemvm["id"]}" do
    cwd "#{node["cloudstack"]["storage"]["temporary"]}"
    not_if { ::File.directory?("#{node["cloudstack"]["storage"]["secondary"]}/template/tmpl/1/#{systemvm["id"]}") }
  end
end

include_recipe "mysql::client"
include_recipe "mysql::server"

include_recipe "co-nfs::server"
include_recipe "co-nfs::exports"

include_recipe "nat-router"

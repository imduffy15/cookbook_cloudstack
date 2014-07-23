#
# Cookbook Name:: cloudstack
# Recipe:: management server
#

template '/etc/yum.repos.d/cloudstack.repo' do
  source 'cloudstack.repo.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

package 'cloudstack-management' do
  action :install
end

include_recipe 'cloudstack::database'

include_recipe 'cloudstack::sys-tmpl'

include_recipe 'cloudstack::storage'

remote_file '/usr/share/cloudstack-common/scripts/vm/hypervisor/xenserver' do
  action :create_if_missing
  source node['cloudstack']['management']['vhd-util']
end

bash 'initialize cloudstack databases' do
	code <<-EOH
		/usr/bin/cloudstack-setup-databases #{node['cloudstack']['management']['database']['user']}:#{node['cloudstack']['management']['database']['password']} --deploy-as #{node['cloudstack']['management']['database']['deployuser']}:#{node['cloudstack']['management']['database']['deploypass']} -m #{node['cloudstack']['management']['database']['management_key']} -k #{node['cloudstack']['management']['database']['database_key']}
	EOH
end

bash 'setup cloudstack' do
	code <<-EOH
		/usr/bin/cloudstack-setup-management
	EOH
	not_if { ::File.exists?("/etc/cloudstack/management/tomcat6.conf") }
end
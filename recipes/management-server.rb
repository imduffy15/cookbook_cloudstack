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

bash 'Install Development tools' do
  code <<-EOH
      yum groupinstall "Development tools" -y
  EOH
  not_if "yum grouplist installed | grep 'Development tools'"
end

include_recipe 'python::default'

%w{cloudstack-management}.each do |pkg|
  package pkg do
    action :install
  end
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

bash 'enable the integration api port' do
  code <<-EOH
    mysql -u#{node['cloudstack']['management']['database']['user']} -p#{node['cloudstack']['management']['database']['password']} -e "update cloud.configuration set value=8096 where name='integration.api.port'"
    /etc/init.d/cloudstack-management restart
  EOH
end

bash 'Install Cloudstack Marvin' do
  code <<-EOH
    /usr/local/bin/pip2.7 install #{node['cloudstack']['management']['marvin-url']} --allow-external mysql-connector-python
  EOH
end
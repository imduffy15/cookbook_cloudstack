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


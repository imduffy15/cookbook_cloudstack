#
# Cookbook Name:: cloudstack
# Recipe:: development-environment
#

bash 'Install Development tools' do
  code <<-EOH
      yum groupinstall "Development tools" -y
  EOH
  not_if "yum grouplist installed | grep 'Development tools'"
end

%w{java-1.7.0-openjdk-devel genisoimage ws-commons-util MySQL-python createrepo git python python-devel nc python-setuptools unzip}.each do |pkg|
  package pkg do
    action :install
  end
end

cookbook_file 'java.sh' do
  action :create_if_missing
  mode 0755
  path '/etc/profile.d/java.sh'
end

remote_file "#{node['cloudstack']['storage']['temporary']}/tomcat.tar.gz" do
  action :create_if_missing
  source node['tomcat']['url']
end

bash 'Extract tomcat' do
  code <<-EOH
    mkdir -p #{node['tomcat']['install_path']}
    tar xzf "#{node['cloudstack']['storage']['temporary']}/tomcat.tar.gz" -C #{node['tomcat']['install_path']} --strip 1
  EOH
  not_if { ::File.exists?(node['tomcat']['install_path']) }
end

template '/etc/profile.d/tomcat.sh' do
  source 'tomcat.erb'
  mode 0755
  owner 'root'
  group 'root'
end

remote_file "#{node['cloudstack']['storage']['temporary']}/maven.tar.gz" do
  action :create_if_missing
  source node['maven']['url']
end

bash 'Extract maven' do
  code <<-EOH
    mkdir -p #{node['maven']['install_path']}
    tar xzf "#{node['cloudstack']['storage']['temporary']}/maven.tar.gz" -C #{node['maven']['install_path']} --strip 1
  EOH
  not_if { ::File.exists?(node['maven']['install_path']) }
end

template '/etc/profile.d/maven.sh' do
  source 'maven.erb'
  mode 0755
  owner 'root'
  group 'root'
end

remote_file "#{node["cloudstack"]["storage"]["temporary"]}/cloudstack.tar.gz" do
  action :create_if_missing
  source node["cloudstack"]["development"]["url"]
end

bash 'Extract the cloudstack codebase' do
  code <<-EOH
    mkdir -p #{node["cloudstack"]["development"]["source_path"]}
    tar xzf "#{node["cloudstack"]["storage"]["temporary"]}/cloudstack.tar.gz" -C #{node["cloudstack"]["development"]["source_path"]} --strip 1
  EOH
  not_if { ::File.exists?(node["cloudstack"]["development"]["source_path"]) }
end
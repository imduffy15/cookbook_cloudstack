#
# Cookbook Name:: cloudstack
# Recipe:: simulator
#

include_recipe 'cloudstack::database'
include_recipe 'cloudstack::development-environment'

template '/etc/init.d/cloudstack-simulator' do
  source 'cloudstack-simulator.erb'
  mode 0755
  owner 'root'
  group 'root'
end

execute 'chkconfig --level 345 cloudstack-simulator on'

bash 'Compile Cloudstack' do
  code <<-EOH
    source /etc/profile.d/maven.sh
    mvn -Pimpatient -Dsimulator -DskipTests -Dcheckstyle.skip=true install -T C1.5
  EOH
  cwd node['cloudstack']['development']['source_path']
end

bash 'Compile Cloudstack (APIDOCS)' do
  code <<-EOH
	  source /etc/profile.d/maven.sh
	  mvn install
  EOH
  cwd "#{node['cloudstack']['development']['source_path']}/tools/apidoc"
end

bash 'Install Marvin' do
  code <<-EOH
    source /etc/profile.d/maven.sh
    mvn generate-sources
    python setup.py install
  EOH
  cwd "#{node['cloudstack']['development']['source_path']}/tools/marvin"
end

bash 'Deploy simulator database' do
  code <<-EOH
    source /etc/profile.d/maven.sh
    mvn -Pdeveloper -pl developer -Ddeploydb
    mvn -Pdeveloper -pl developer -Ddeploydb-simulator
  EOH
  cwd node['cloudstack']['development']['source_path']
end

service 'cloudstack-simulator' do
  action :start
end

bash 'Deploy simulator configuration' do
  code <<-EOH
    python -m marvin.deployDataCenter -i #{node['cloudstack']['development']['simulator']['type']}.cfg || true
  EOH
  cwd "#{node['cloudstack']['development']['source_path']}/setup/dev"
end

service 'cloudstack-simulator' do
  action :stop
end

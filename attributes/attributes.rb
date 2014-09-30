#
# Cookbook Name:: cloudstack
# Attributes:: default
#

default['cloudstack']['hypervisors'] = {
    'xenserver' => 1,
    'kvm' => 3,
    'vsphere' => 8,
    'hyperv' => 9,
    'lxc' => 10
}

default['cloudstack']['management']['version'] = '4.3'
default['cloudstack']['management']['repo'] = "http://cloudstack.apt-get.eu/rhel/#{default['cloudstack']['management']['version']}/"
default['cloudstack']['management']['vhd-util'] = 'http://download.cloud.com.s3.amazonaws.com/tools/vhd-util'

default['cloudstack']['management']['marvin-url'] = 'http://ianduffy.ie/Marvin-0.1.0.tar.gz'

default['cloudstack']['management']['database']['user'] = 'cloud'
default['cloudstack']['management']['database']['password'] = 'cloud'
default['cloudstack']['management']['database']['deployuser'] = 'root'
default['cloudstack']['management']['database']['management_key'] = 'cloud'
default['cloudstack']['management']['database']['database_key'] = 'cloud'

default['cloudstack']['config']['path'] = '/vagrant/config.cfg'

default['cloudstack']['storage']['temporary'] = Chef::Config['file_cache_path']
default['cloudstack']['storage']['primary'] = '/exports/primary'
default['cloudstack']['storage']['secondary'] = '/exports/secondary'

default['cloudstack']['systemvms'] = [
    {
        'hypervisor' => 'XenServer',
        'url' => 'http://download.cloud.com/templates/4.3/systemvm64template-2014-06-23-master-xen.vhd.bz2',
    }
]

#default["cloudstack"]["development"]["repository"] = "https://github.com/apache/cloudstack.git"
default['cloudstack']['development']['branch'] = '4.4-forward'
default['cloudstack']['development']['url'] = "https://github.com/apache/cloudstack/archive/#{default['cloudstack']['development']['branch']}.tar.gz"


default['cloudstack']['development']['source_path'] = '/opt/cloudstack'
default['cloudstack']['development']['log'] = '/opt/cloudstack/cloudstack-simulator.log'

default['cloudstack']['development']['simulator']['type'] = 'advanced'

default['tomcat']['install_path'] = '/opt/tomcat'
default['tomcat']['version'] = '6.0.33'
default['tomcat']['url'] = "http://archive.apache.org/dist/tomcat/tomcat-6/v#{default['tomcat']['version']}/bin/apache-tomcat-#{default['tomcat']['version']}.tar.gz"

default['maven']['install_path'] = '/opt/maven'
default['maven']['version'] = '3.0.4'
default['maven']['url'] = "https://archive.apache.org/dist/maven/binaries/apache-maven-#{default['maven']['version']}-bin.tar.gz"
default['maven']['repository'] = '/opt/maven/repository'

default['nfs']['exports'] = [
    '/exports *(rw,async,no_root_squash)'
]

default['mysql']['server_root_password'] = ''
default['mysql']['server_repl_password'] = ''
default['mysql']['server_debian_password'] = ''
default['mysql']['allow_remote_root'] = true

default["python"]["install_method"] = 'source'

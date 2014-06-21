#
# Cookbook Name:: cloudstack
# Attributes:: default
#

default["cloudstack"]["hypervisors"] = {
    "XenServer" => 1,
    "KVM" => 3,
    "vSphere" => 8,
    "HyperV" => 9,
    "LXC" => 10
}

default["cloudstack"]["storage"]["temporary"] = Chef::Config['file_cache_path']
default["cloudstack"]["storage"]["secondary"] = "/exports/secondary"

default["cloudstack"]["systemvms"] = [
    {
        "hypervisor" => "XenServer",
        "url" => "http://jenkins.buildacloud.org/view/4.4/job/cloudstack-4.4-systemvm/lastSuccessfulBuild/artifact/tools/appliance/dist/systemvmtemplate-unknown-xen.vhd.bz2",
    }
]


default["tomcat"]["install_path"] = "/opt/tomcat"
default["tomcat"]["version"] = "6.0.33"
default["tomcat"]["url"] = "http://archive.apache.org/dist/tomcat/tomcat-6/v#{default["tomcat"]["version"]}/bin/apache-tomcat-#{default["tomcat"]["version"]}.tar.gz"

default["maven"]["install_path"] = "/opt/maven"
default["maven"]["version"] = "3.0.4"
default["maven"]["url"] = "https://archive.apache.org/dist/maven/binaries/apache-maven-#{default["maven"]["version"]}-bin.tar.gz"

default["nfs"]["exports"] = [
    "/exports *(rw,async,no_root_squash)"
]

default["mysql"]["server_root_password"] = ""
default["mysql"]["server_repl_password"] = ""
default["mysql"]["server_debian_password"] = ""
default["mysql"]["allow_remote_root"] = true

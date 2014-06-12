default["cloudstack"]["storage"]["temporary"] = "/tmp/cloudstack"
default["cloudstack"]["storage"]["secondary"] = "/exports/secondary"

default["cloudstack"]["systemvms"] = [
	{
		"id" => 1,
		"hypervisor" => "xenserver",
		"url" => "http://jenkins.buildacloud.org/view/4.4/job/cloudstack-4.4-systemvm/lastSuccessfulBuild/artifact/tools/appliance/dist/systemvmtemplate-unknown-xen.vhd.bz2"
	}
]

default["nfs"]["exports"] = [
	"/exports *(rw,async,no_root_squash)"
]

default["mysql"]["server_root_password"] = ""
default["mysql"]["server_repl_password"] = ""
default["mysql"]["server_debian_password"] = ""
default["mysql"]["allow_remote_root"] = true

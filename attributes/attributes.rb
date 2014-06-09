default["cloudstack"]["storage"]["temporary"] = "/tmp/cloudstack"
default["cloudstack"]["storage"]["secondary"] = "/exports/secondary"

default["cloudstack"]["systemvms"] = [
	{
		"id" => 1,
		"hypervisor" => "xenserver",
		"url" => "http://download.cloud.com/templates/4.3/systemvm64template-2014-01-14-master-xen.vhd.bz2"
	}
]

default["nfs"]["exports"] = [
	"/exports *(rw,async,no_root_squash)"
]

default["mysql"]["server_root_password"] = ""
default["mysql"]["server_repl_password"] = ""
default["mysql"]["server_debian_password"] = ""
default["mysql"]["allow_remote_root"] = true

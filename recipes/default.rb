#
# Cookbook Name:: cloudstack
# Recipe:: default
#

include_recipe "nat-router"

include_recipe "mysql::client"
include_recipe "mysql::server"

include_recipe "cloudstack::sys-tmpl"

include_recipe "co-nfs::server"
include_recipe "co-nfs::exports"
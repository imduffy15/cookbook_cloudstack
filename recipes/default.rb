#
# Cookbook Name:: cloudstack
# Recipe:: default
#


include_recipe "mysql::client"

include_recipe "co-nfs::server"
include_recipe "co-nfs::exports"

include_recipe "nat-router"
#
# Cookbook Name:: cloudstack
# Recipe:: storage
#

include_recipe 'co-nfs::server'
include_recipe 'co-nfs::exports'
#
# Cookbook Name:: cloudstack
# Recipe:: default
#

include_recipe 'nat-router'

include_recipe 'cloudstack::database'

include_recipe 'cloudstack::sys-tmpl'

include_recipe 'cloudstack::storage'
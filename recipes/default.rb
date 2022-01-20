#
# Cookbook:: library
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

apt_update
include_recipe 'library::web'

cookbook_file '/usr/lib/cgi-bin/library' do
  source 'library.rb'
  mode '0755'
  owner 'vagrant'
  group 'vagrant'
end

include_recipe 'library::db_install'
include_recipe 'library::db_setup'

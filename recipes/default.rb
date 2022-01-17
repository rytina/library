#
# Cookbook:: library
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
apt_update
include_recipe 'library::web'
include_recipe 'library::db_install'
include_recipe 'library::db_setup'

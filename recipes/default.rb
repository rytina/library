#
# Cookbook:: library
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
include_recipe "apt"
include_recipe "library::web"
include_recipe "library::db_install"

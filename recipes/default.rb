#
# Cookbook:: library
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

RUBY_VERSION = '3.1.0'
RUBY_VERSION.freeze

apt_update
include_recipe 'library::web'
include_recipe 'library::db_install'
include_recipe 'library::db_setup'
rbenv_system_install 'system'
rbenv_user_install 'vagrant'

rbenv_ruby RUBY_VERSION do
  user 'vagrant'
end

rbenv_global RUBY_VERSION do
  user 'vagrant'
end

execute 'a2enmod cgid' do
  command '/usr/sbin/a2enmod cgid'
  notifies :reload, 'service[apache2]', :delayed
end


postgresql_client_install 'PostgreSQL Client' do
  setup_repo false
  subscribes :create, "file[/usr/local/rbenv]", :before
end

postgresql_server_install 'PostgreSQL Server' do
  setup_repo false
  subscribes :create, "file[/usr/local/rbenv]", :before
end

postgresql_user 'vagrant'

postgresql_database 'library' do
  owner 'vagrant'
  subscribes :create, "file[/usr/local/rbenv]", :before
end

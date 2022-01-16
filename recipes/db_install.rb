
postgresql_client_install 'PostgreSQL Client' do
  setup_repo false
end

postgresql_server_install 'PostgreSQL Server' do
  setup_repo false
end

postgresql_user 'vagrant'

postgresql_database 'library' do
  owner 'vagrant'
end

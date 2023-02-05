package 'ubuntu-dev-tools'
package 'libpq-dev'
chef_gem 'pg'

RUBY_VERSION = '3.1.0'
RUBY_VERSION.freeze

rbenv_system_install 'system'
rbenv_ruby RUBY_VERSION

directory '/usr/local/rbenv' do
  action :create
  path '/usr/local/rbenv'
  notifies :run, 'postgresql_access[local_postgres_user_vagrant]', :immediately
end

postgresql_access 'local_postgres_user_vagrant' do
  access_type 'local'
  access_db 'all'
  access_user 'vagrant'
  access_addr nil
  access_method 'md5'
  subscribes :create, "file[/usr/local/rbenv]", :before
end

ruby_block 'create_library' do
  block do
    # true until ::File.exists?('/usr/local/rbenv')
    puts '\ncreate table favorite_books'
    require 'pg' unless defined?(PG)
    con = PG.connect dbname: 'library', user: 'vagrant', password: 'vagrant'
    con.exec 'DROP TABLE IF EXISTS favorite_books'
    con.exec 'CREATE TABLE favorite_books(Id INTEGER PRIMARY KEY,  Name VARCHAR(100))'
    con.exec "INSERT INTO favorite_books VALUES(1,'The Fool on the Hill')"
    con.exec "INSERT INTO favorite_books VALUES(2,'Lord of the Rings')"
    con.exec "INSERT INTO favorite_books VALUES(3,'Das Parfum')"
    con.exec "INSERT INTO favorite_books VALUES(4,'Kuckucksei')"
    con.exec "INSERT INTO favorite_books VALUES(5,'Wien wartet auf Dich!')"
    con.exec "INSERT INTO favorite_books VALUES(6,'Vom Mythos des Mann-Monats')"
    con.exec "INSERT INTO favorite_books VALUES(7,'The Pragmatic Programmer')"
    con.exec "INSERT INTO favorite_books VALUES(8,'Dreaming in Code')"
    con.exec "INSERT INTO favorite_books VALUES(9,'The Clean Coder')"
    con.exec "INSERT INTO favorite_books VALUES(10,'Growing Object-Oriented Software, Guided by Tests')"
    con.exec "INSERT INTO favorite_books VALUES(11,'Per Anhalter durch die Galaxie')"
  rescue PG::Error => e
    puts e.message
  ensure
    con.close if con
  end
  subscribes :create, "file[/usr/local/rbenv]", :delayed
end



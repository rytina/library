
packages = %w(
  ubuntu-dev-tools
  postgresql-contrib
)

packages.each { |name| package name }

chef_gem('pg')

def create_table
  require 'pg'
  begin
    con = PG.connect dbname: 'library', user: 'vagrant'
    puts con.server_version
    con.exec 'DROP TABLE IF EXISTS MyFavoriteBooks'
    con.exec 'CREATE TABLE MyFavoriteBooks(Id INTEGER PRIMARY KEY,  Name VARCHAR(100))'
    con.exec "INSERT INTO MyFavoriteBooks VALUES(1,'The Fool on the Hill')"
    con.exec "INSERT INTO MyFavoriteBooks VALUES(2,'Lord of the Rings')"
    con.exec "INSERT INTO MyFavoriteBooks VALUES(3,'Das Parfum')"
  rescue PG::Error => e
    puts e.message
  ensure
    con.close if con
  end
end

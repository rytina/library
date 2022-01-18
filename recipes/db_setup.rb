package 'ubuntu-dev-tools'

chef_gem 'pg'

require 'pg' unless defined?(PG)

def create_table
  begin
    con = PG.connect dbname: 'library', user: 'vagrant'
    con.exec 'DROP TABLE IF EXISTS favorite_books'
    con.exec 'CREATE TABLE favorite_books(Id INTEGER PRIMARY KEY,  Name VARCHAR(100))'
    con.exec "INSERT INTO favorite_books VALUES(1,'The Fool on the Hill')"
    con.exec "INSERT INTO favorite_books VALUES(2,'Lord of the Rings')"
    con.exec "INSERT INTO favorite_books VALUES(3,'Das Parfum')"
  rescue PG::Error => e
    puts e.message
  ensure
    con.close if con
  end
end

create_table

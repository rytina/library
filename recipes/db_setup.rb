chef_gem("pg") do
    package_name "pg"
    action [:install]
    retries 0
    retry_delay 2
    default_guard_interpreter
    gem_binary "/opt/chef/embedded/bin/gem"
  end
  
  def create_table()
    require 'pg'
  begin
      con = PG.connect :dbname => 'library', :user => 'vagrant'
      puts con.server_version
  
      con.exec "DROP TABLE IF EXISTS MyFavoriteBooks"
      con.exec "CREATE TABLE MyFavoriteBooks(Id INTEGER PRIMARY KEY, 
          Name VARCHAR(100))"
      con.exec "INSERT INTO MyFavoriteBooks VALUES(1,'The Fool on the Hill')"
      con.exec "INSERT INTO MyFavoriteBooks VALUES(2,'Lord of the Rings')"
      con.exec "INSERT INTO MyFavoriteBooks VALUES(3,'Das Parfum')"
  
  rescue PG::Error => e
    puts e.message 
      
  ensure
    con.close if con
  end  
  
  #create_table
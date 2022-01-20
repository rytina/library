#!/usr/local/rbenv/shims/ruby
require 'pg' unless defined?(PG)

puts "Content-type: text/html\n\n"
puts "<html><body>"
con = PG.connect dbname: 'library', user: 'vagrant', password: 'vagrant'
puts con.exec 'Select Name from favorite_books;'
puts "</body></html>"
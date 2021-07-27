require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('pry')
also_reload('lib/**/*.rb')
require 'pg'


DB = PG.connect({:dbname => "vetdoc"})

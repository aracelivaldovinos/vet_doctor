require 'rspec'
require 'patient'
require 'doctor'
require 'pry'
require 'pg'


DB = PG.connect({:dbname => 'vetdoc_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end
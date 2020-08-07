require 'bundler'
Bundler.require
# require 'sinatra/cookies'
require_all 'app'

ActiveRecord::Base.establish_connection({
  database: ENV['DATABASE_URL'] || 'postgres://localhost/mydb'
})

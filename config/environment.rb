require 'bundler'
Bundler.require
require_all 'app'

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || {
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
})

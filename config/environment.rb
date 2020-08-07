require 'bundler'
Bundler.require
# require 'sinatra/cookies'
require_all 'app'

db = URI.parse(ENV['HEROKU_POSTGRESQL_PUCE_URL'] || 'postgres://localhost/database_name')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)

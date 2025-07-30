require 'bundler/setup'
Bundler.require
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db/development.sqlite3"}

require_all 'app'

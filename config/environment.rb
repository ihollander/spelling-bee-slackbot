ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, 'sqlite3:db/database.db'
end

require_all 'models'
require_all 'middleware'
require './app'
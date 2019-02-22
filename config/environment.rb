ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require_relative '../slack_message'
require_relative '../slack_command'
require_relative '../authenticate'
require_relative '../app'
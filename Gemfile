# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'rake'
gem 'thin'
gem 'require_all'
gem 'dotenv'

group :development do
	gem 'shotgun'
	gem 'pry'
  gem 'rb-readline'
  gem 'tux'
  gem 'sqlite3', '~> 1.3.6'
end
    
group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
end
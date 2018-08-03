# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'activerecord-postgis-adapter'
gem 'bundler-audit'
gem 'graphql'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '~> 5.2.0'
gem 'rgeo-geojson'

group :development, :test do
  gem 'pry-nav'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'coveralls', require: false
  gem 'simplecov', require: false
end

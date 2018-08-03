# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "bundler-audit"
gem "rails", "~> 5.2.0"
gem "pg", ">= 0.18", "< 2.0"
gem "bootsnap", ">= 1.1.0", require: false
gem 'activerecord-postgis-adapter'
gem 'rgeo-geojson'
gem 'graphql'

group :development, :test do
  gem 'pry-nav'
  gem "rspec-rails", "~> 3.7"
  gem "rubocop", require: false
  gem "rubocop-rails_config"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
end

group :test do
  gem "shoulda-matchers", "~> 3.1"
  gem 'factory_bot'
end

#! /usr/bin/env ruby

require 'config/application'

require 'logger'
set :database, Application.configuration.database.url
require_relative 'app/model'

configure :development do
  database.loggers << Logger.new(STDOUT)
end


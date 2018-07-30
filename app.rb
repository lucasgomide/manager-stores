#! /usr/bin/env ruby
require 'config/application'
require 'logger'

configure :development do
  database.loggers << Logger.new(STDOUT)
end

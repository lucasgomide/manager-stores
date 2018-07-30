require File.expand_path('./application', __dir__)
require 'logger'

require 'bundler'
Bundler.require

$LOAD_PATH << File.expand_path(__dir__)

set :environment, Application.env
set :database, Application.configuration.database.url

configure :development do
  database.loggers << Logger.new(STDOUT)
end

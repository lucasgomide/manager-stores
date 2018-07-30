# frozen_string_literal: true

require File.expand_path('application/database_configuration', __dir__)

# Application module has basic information about application and
# provide access to app's configuration
module Application
  def self.env
    ENV['APP_ENV'] || 'development'
  end

  def self.configuration
    Configuration
  end

  def self.root
    File.expand_path('..', __dir__)
  end

  # Configuration is a configuration application wrapper
  module Configuration
    def self.database
      DatabaseConfiguration.new
    end
  end
end

require 'bundler'
Bundler.require
require 'pry'

$LOAD_PATH << File.expand_path(__dir__)
require 'logger'

set :environment, Application.env
set :database, Application.configuration.database.url

configure :development do
  database.loggers << Logger.new(STDOUT)
end
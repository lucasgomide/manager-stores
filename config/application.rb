require 'bundler'
Bundler.require
$: << File.expand_path('../', __FILE__)
require File.expand_path('application/database_configuration', __dir__)

module Application
  def self.env
    ENV['APP_ENV'] || 'development'
  end

  def self.configuration
    Configuration
  end

  def self.root
    File.expand_path('../../', __FILE__)
  end

  module Configuration
    def self.database
      DatabaseConfiguration.new
    end
  end
end

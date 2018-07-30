# frozen_string_literal: true

require 'yaml'
module Application
  # DatabaseConfiguration is a wrapper of some database
  # configuration
  class DatabaseConfiguration
    def initialize(
      configuration_path = "#{Application.root}/config/database.yml"
    )
      @configuration_path = configuration_path
    end

    def name
      url.split('/').last
    end

    def url
      configuration['url']
    end

    private

    def configuration
      conf = File.read(@configuration_path)
      @configuration ||= YAML.safe_load(ERB.new(conf).result, [], [], true)
                             .fetch(Application.env, {})
                             .freeze
    end
  end
end

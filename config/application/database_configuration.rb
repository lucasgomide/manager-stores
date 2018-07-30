require 'yaml'
module Application
  class DatabaseConfiguration
    def initialize(configuration_path = "#{Application.root}/config/database.yml")
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
      @configuration ||= YAML.load(ERB.new(conf).result)
        .fetch(Application.env, {})
        .freeze
    end
  end
end

require 'simplecov'

formatters = [SimpleCov::Formatter::HTMLFormatter]

if ENV['COVERALLS_REPO_TOKEN']
  require 'coveralls'
  formatters << Coveralls::SimpleCov::Formatter
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)

SimpleCov.start 'rails'

# frozen_string_literal: true

ENV['APP_ENV'] = 'test'
require 'pry'
require 'rspec_sequel_matchers'
require File.expand_path('../config/boot', __dir__)

files = Dir.glob(File.join(Application.root, 'app', '**', '**', '*rb')) +
        Dir.glob(File.join(Application.root, 'spec', 'support', '*.rb'))
files.each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.order = :random

  config.filter_run_when_matching :focus
end


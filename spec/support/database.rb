# frozen_string_literal: true

DB = database

RSpec.configure do |config|
  config.around(:each) do |example|
    DB.transaction(rollback: :always, auto_savepoint: true) { example.run }
  end
end

RSpec.configure do |config|
  config.before(:suite) do
    # DatabaseCleaner.strategy = :transaction
    # DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :truncation, {:except => %w[spatial_ref_sys]}
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

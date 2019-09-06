ENV['RAILS_ENV'] = 'test'

RSpec.configure do |config|
  require 'simplecov'
  require 'rails_helper'
  require 'rspec/rails'
  require 'shoulda/matchers'
  require 'factory_bot_rails'

  SimpleCov.start 'rails' do
    add_filter '/lib/tasks'
  end

  config.include FactoryBot::Syntax::Methods
  config.example_status_persistence_file_path = 'spec/failed_tests.txt'
  config.profile_examples = true
  config.use_transactional_fixtures = true

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

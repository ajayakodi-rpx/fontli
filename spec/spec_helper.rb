# This file is copied to spec/ when you run 'rails generate rspec:install'

ENV["RAILS_ENV"] ||= 'test'
# if ENV["COV"]
  require 'simplecov'
  SimpleCov.start 'rails'
  SimpleCov.at_exit do
    SimpleCov.result.format!
    `open coverage/index.html`
  end
# end

require File.expand_path("../../config/environment", __FILE__)
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true
  config.include Mongoid::Matchers
end

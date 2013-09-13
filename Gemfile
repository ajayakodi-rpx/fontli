source 'http://rubygems.org'

gem 'rake', '10.0.3'
gem 'rails', '3.2.14'
gem 'therubyracer', '0.9.9'
gem 'mongoid', '2.3.3'
gem 'bson_ext' #Version should be same as 'mongo' gem
gem 'fbgraph', '1.9.0'
gem 'twitter_oauth', '0.4.3'
gem 'airbrake', '3.1.6'
gem 'redis', '2.2.2'
gem 'resque', '1.23.0'
gem 'resque_mailer', '2.2.2'
gem 'apn_sender', '1.0.5', :require => 'apn'
gem 'newrelic_rpm', '3.6.0.78'

gem 'fog'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
  gem 'less-rails'
  gem 'turbo-sprockets-rails3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Web page scrapper
gem 'hpricot', '0.8.6'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development, :test do
  gem 'mongoid-rspec'
  gem 'simplecov', '>= 0.4.0'
end

group :development do
  gem 'capistrano', '2.15.5'
  gem 'capistrano-ext', '1.2.1'
  gem 'unicorn'
end

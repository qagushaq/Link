# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'action_policy', '~> 0.6'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.5.2'
gem 'rails', '~> 7.0'

# Dry-family
gem 'dry-auto_inject', '~> 0.8'
gem 'dry-validation', '~> 1.7'

# A set of responders modules to dry up your Rails app.
gem 'responders', '~> 3.0', '>= 3.0.1'

# A fast JSON:API serializer for Ruby Objects.
gem 'jsonapi-serializer', '~> 2.2'

# API documentation
# Dec 20, 2021: No released version of rswag supports Rails 7. Using master from github.
gem 'rswag', github: 'rswag/rswag'

# A fast JSON parser and Object marshaller as a Ruby gem.
gem 'oj', '~> 3.12', '>= 3.12.1'

# Background jobs
gem 'sidekiq', '~> 6.1', '>= 6.1.3'
gem 'sidekiq-scheduler', '~> 3.0', '>= 3.0.1'

# C library client wriper for Redis
gem 'hiredis', '~> 0.6', '>= 0.6.3'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.1', '>= 1.1.1'

# Push notifications
gem 'fcm', '~> 1.0', '>= 1.0.2'

# Social networks authentication

# Versioned API support
gem 'versioner', github: 'alg/versioner'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
end

group :development do
  gem 'listen', '~> 3.7'
  gem 'reek', '~> 6.0', '>= 6.0.6', require: false
  gem 'rubocop', '~> 1.0', '>= 1.23', require: false
  gem 'rubocop-performance', '~> 1.0', '>= 1.12.0', require: false
  gem 'rubocop-rails', '~> 2.0', '>= 2.12.4', require: false
  gem 'rubocop-rspec', '~> 2.0', '>= 2.6.0', require: false
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0', '>= 2.0.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'shoulda-matchers', '~> 5.0', '>= 5.0.0'
  gem 'simplecov', '~> 0.21', '>= 0.21.2', require: false
  gem 'test-prof', '~> 1.0', '>= 1.0.7'
  gem 'webmock', '~> 3.0', '>= 3.14.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

source 'https://rubygems.org'

gem 'active_model_serializers', '~> 0.9.3'
gem 'active_skin'
gem 'activeadmin', '~> 1.3.0'
gem 'activeadmin_addons'
gem 'aws-sdk', '~> 3'
gem 'bootsnap', require: false
gem 'coffee-rails', '~> 4.2'
gem "devise", ">= 4.7.1"
gem 'devise-i18n'
gem 'enumerize'
gem 'httparty'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.21'
gem 'power-types'
gem 'puma', '~> 3.12'
gem 'rack-cors', '~> 1.0.5'
gem 'rails', '~> 5.2.3'
gem 'rails-i18n'
gem 'responders'
gem 'sass-rails', '~> 5.0'
gem 'sentry-raven'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'simple_token_authentication', '~> 1.0'
gem 'slack-ruby-client'
gem 'spring'
gem 'strong_migrations'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'versionist'
gem 'webpacker', github: 'rails/webpacker'

group :production do
  gem 'heroku-stage'
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
end

group :test do
  gem 'rspec_junit_formatter', '0.2.2'
  gem 'shoulda-matchers', require: false
end

group :development do
  gem 'annotate'
  gem 'listen'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-nc', require: false
  gem 'rspec-rails'
end

group :production, :development, :test do
  gem 'tzinfo-data'
end

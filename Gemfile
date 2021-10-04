source 'https://rubygems.org'

ruby '2.7.2'

gem 'active_model_serializers'
gem 'jsonapi-rails'

gem 'devise', '~> 4.7'
gem 'devise-jwt', '~> 0.7'

gem 'rolify'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'


gem 'bootsnap', '>= 1.4.4', require: false

gem 'rack-cors'

group :development, :test do
  gem 'pry'    # Call `binding.pry` to get a debugger console
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'listen'
  gem 'spring'   # Spring keeps app running in bg to speed up development. More: https://github.com/rails/spring
  gem 'spring-watcher-listen'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'jsonapi-rspec'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: %w[mingw mswin x64_mingw jruby]

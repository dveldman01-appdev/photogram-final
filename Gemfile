source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
gem 'bcrypt'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rack-timeout', require: 'rack/timeout/base'
gem 'sprockets', '< 4'
gem 'sassc-rails'
gem 'execjs'
gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'amazing_print'
  gem 'dotenv-rails'
  gem 'grade_runner', github: 'firstdraft/grade_runner'
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4.1'
  gem 'table_print'
  gem 'web_git', github: 'firstdraft/web_git', branch: 'spring2020'
end

group :development do
  gem 'annotate'
  gem 'better_errors', '2.6'
  gem 'binding_of_caller'
  gem 'draft_generators', github: 'firstdraft/draft_generators', branch: 'winter-2020'
  gem 'letter_opener'
  gem 'meta_request'
  gem 'rails_db', '2.3.1'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'webmock'
  gem 'rspec-html-matchers'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
end

gem "carrierwave"
gem "cloudinary"

gem 'humanize_boolean'

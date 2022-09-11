source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'bootstrap-sass', '3.4.1'
gem 'materialize-sass', '~> 1.0.0'
gem 'material_icons' 
# Use sqlite3 as the database for Active Record
gem 'bcrypt', '~> 3.1.13'
gem 'faker', '2.20.0'
gem 'will_paginate', '3.3.1'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'cocoon'
gem 'activerecord-precounter'
# gem 'sqlite3', '~> 1.4'

gem 'mysql2'
gem 'net-smtp'
gem 'net-imap'
gem 'net-pop'
gem 'psych', '~> 3.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# For 6.0.0 or higher
gem 'rails-i18n', '~> 6.0.0'

gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'carrierwave'

gem 'high_voltage'
gem 'gon'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '>= 4.1.0'
  gem 'pre-commit'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'guard', '2.16.2'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'

# PostgreSQL als DB
gem 'pg'

gem 'sass-rails',   '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0'

gem 'uglifier', '>= 1.3.0'

# Until there we get to some design...
gem 'bootstrap-sass'

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# Authentication with Devise
gem 'devise'

# Simplifying forms (also bootstrap support)
gem 'simple_form'

gem 'select2-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  # Opening E-Mails in Browser
  gem 'letter_opener'

  # Error displaying
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'pry' # guard requires it anyway, so why not :-)
end

# Testing
group :test, :development do
  gem 'rspec-rails', '~> 2.0' # dev for generators being available
  gem 'guard-rspec'
  gem 'rb-inotify', '~> 0.9' # guard performance
  gem 'jasminerice', :git => 'https://github.com/bradphelan/jasminerice.git'
  gem 'guard-jasmine'
end
group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'poltergeist'
end

ruby '2.0.0'
# Additional dependencies
# A JS Runtime - node.js i.e.
# PostgreSQL Server (and libpq-dev)
# PhantomJS >= 1.8.1 (ubuntu 13.04 package is at 1.6.0 - ubuntu >= 13.10 has 1.9 which is fine) for js testing without browser
source 'https://rubygems.org'

gem 'rails', '4.0.0.beta1'

# PostgreSQL als DB
gem 'pg'

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  gem 'uglifier', '>= 1.0.3'

  # Until there we get to some design...
  gem 'bootstrap-sass'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# Authentication with Devise
gem 'devise', github: 'idl3/devise', branch: 'rails4'

# Simplifying forms (also bootstrap support)
gem 'simple_form', github: 'plataformatec/simple_form'


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
end
group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
end

# Additional dependencies
# A JS Runtime - node.js i.e.
# PostgreSQL Server (and libpq-dev)
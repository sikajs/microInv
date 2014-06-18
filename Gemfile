source 'https://rubygems.org'

ruby '2.1.2'
#ruby-gemset=smeRails

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg', '0.17.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# pagination with bootstrap support
gem 'will_paginate', '~> 3.0'
gem "will_paginate-bootstrap", "~> 1.0.0"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'pry'
  #gem 'pry-debugger'
  gem 'pry-byebug'
end
 
group :test do
  gem 'capybara'
  #gem 'libnotify'  #only apply on Linux for guard gem
  gem 'factory_girl_rails', '4.2.1'
end

group :production do
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  #gem 'guard-rspec'
end

# Use ransack to deal with some search forms
gem "ransack", github: "activerecord-hackery/ransack", branch: "rails-4"

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

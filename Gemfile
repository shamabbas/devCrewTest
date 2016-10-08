source 'https://rubygems.org'

ruby '2.2.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'execjs'
gem 'therubyracer', platforms: :ruby
# gem "less-rails"
gem "twitter-bootstrap-rails"
gem 'bootstrap-sass'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec', require: false
  gem 'byebug'
  gem 'rails-footnotes'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'bullet'
  gem 'pry-rails'
  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


group :test do
  gem 'faker'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'capybara'
  gem 'capybara-webkit'
end

# facebook authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

# simple forms
gem 'simple_form'
gem "sprockets-rails"

# Adding REST-based framework for building APIs
gem 'grape'
gem 'grape-entity'
gem 'rack-contrib' # JSONP callbacks
gem 'grape-swagger'
gem 'grape-swagger-rails' # Embedding Swagger into app


# Deployment on Heroku
gem 'rails_12factor', group: :production

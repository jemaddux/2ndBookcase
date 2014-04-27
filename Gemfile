source 'http://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.1'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'unicorn'
gem 'rspec-rails'
gem 'zurb-foundation'
gem 'will_paginate', '> 3.0'
gem 'bcrypt-ruby', '> 3.0'
gem 'protected_attributes'
gem 'stripe'
gem 'faker'
gem 'google-analytics-rails'
gem 'pg'
# gem 'rails_12factor'

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

group :development, :test do
  gem 'rack-mini-profiler'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'simplecov', :require => false
  gem 'sqlite3'
end

group :doc do
  gem 'sdoc', require: false
end

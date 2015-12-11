source 'https://rubygems.org'

gem 'rails'
gem 'pg'
gem 'haml'
gem 'puma' # Use Puma as the app server TODO may need more work https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server

gem 'bootstrap-sass'
gem 'sass-rails'

gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'draper'

gem 'turbolinks'

gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bcrypt'
gem 'pg_search'
gem 'nested-hstore'

# AWS image upload gems
gem 'carrierwave'
gem 'fog'
gem 'rmagick', require: false
gem 'remotipart'
gem 'unf'

gem 'pry-rails'

#gem 'fullcalendar-rails'

#text helpers
gem 'indefinite_article'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'annotate'
  gem 'quiet_assets'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'shoulda-matchers', require: false
end

group :production, :development do
    gem 'pry-byebug'
    gem 'pry-stack_explorer'
end

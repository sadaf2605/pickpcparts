source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#gem "therubyracer"
#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
#gem "twitter-bootstrap-rails"

gem 'bootstrap-sass', '~> 3.3.5'

gem 'font-awesome-rails', '~> 4.3.0.0'

gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'

gem 'activeadmin', '~> 1.0.0.pre1'


# Plus integrations with:
gem 'devise'
gem 'cancan' # or cancancan
gem 'draper'
gem 'pundit'
gem "cocoon"


#gem 'owlcarousel-rails'
gem 'therubyracer'

group :assets do
  gem 'less'
    gem "chardinjs-rails"
    
end

gem "blogit", '1.0.0.rc1'
gem "acts-as-taggable-on"

gem 'carrierwave'
gem "rails-erd"

gem 'scoped_search'

gem 'will_paginate'

gem "select2-rails"

gem "pdfkit"
gem "wkhtmltopdf-binary"

#gem 'puma'
gem "unicorn-rails"

gem "datagrid"

# Use ActiveModel has_secure_password

# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development, :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem "rspec-rails"
  gem 'rspec-activemodel-mocks'
  gem 'factory_girl'

  gem 'nested_attr'
  gem 'formastic_factory_girl_strategy'
  gem 'headless'
  
  gem 'database_cleaner'
#  gem 'wwtd'

end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'sqlite3'
end


group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'yui-compressor'
end

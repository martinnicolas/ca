source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.7'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'therubyracer'

gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

# ---------------------------
# GEMAS PARA GESTIÓN DE PERFILES DE USUARIO
# ---------------------------
gem 'devise'

gem 'jwt'

gem 'cancancan'

# ---------------------------
# GEMAS PARA JQUERY DATEPICKERS
# ---------------------------
gem 'jquery-ui-rails'

#gem 'jquery_datepicker'

# ---------------------------
# GEMAS PARA PROCESAMIENTO DE IMÁGENES
# ---------------------------
gem 'carrierwave'

gem 'cloudinary'

gem 'mini_magick'

# ---------------------------
# GEMAS PARA BOOTSTRAP
# ---------------------------
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails', branch: 'bootstrap3'

gem 'bootstrap-generators', github: 'decioferreira/bootstrap-generators'

# ---------------------------
# GEMA PARA FONTAWESOME
# ---------------------------
gem "font-awesome-rails"

# ---------------------------
# GEMAS PARA DATATABLES
# ---------------------------
gem 'jquery-datatables'

gem 'ajax-datatables-rails', '1.1.0'

gem 'draper' # Para decorators

# ---------------------------
# GEMAS PARA GRÁFICOS
# ---------------------------
gem "chartkick"

# ---------------------------
# GEMAS PARA GENERAR REPORTES PDF
# ---------------------------
gem 'wicked_pdf', '2.0.1'

gem 'wkhtmltopdf-binary', '0.12.5.4'

# ---------------------------
# GEMAS PARA AGRUPAR MINUTO, HORA, DIA ETC.
# ---------------------------
gem 'groupdate'

# GEMAS PARA MANEJO DE API
# ---------------------------
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'rails_12factor', group: :production

ruby '2.4.0'


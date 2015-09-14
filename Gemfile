source 'https://rubygems.org'
ruby '2.2.2'

gem 'sinatra'
gem 'sinatra-contrib', require: %w(sinatra/config_file)
gem 'thin'

gem 'activerecord', require: 'active_record'
gem 'sqlite3'

# for remote
gem "httparty"
# for reading info hashes
gem "treetop-dcf"

group :application do
  # Here should be all the specifics for the application
end

group :test do
  gem 'rspec'
  gem 'coveralls'
  gem 'rubocop'
end

group :development do
  gem 'rake'
  gem 'guard', '2.2.3'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-livereload'
  gem 'guard-shotgun', git: 'https://github.com/rchampourlier/guard-shotgun.git'
  gem 'blam'
end

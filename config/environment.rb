require 'bundler'
Bundler.require

environment = ENV.fetch('RACK_ENV') { 'development' }
config = DBConfig.new(environment).options
ActiveRecord::Base.establish_connection(config)

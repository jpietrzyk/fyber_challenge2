# Encoding: utf-8

require 'rack/test'
require 'rspec'
require 'rspec/mocks'
require 'timecop'
ENV['RACK_ENV'] = 'test'
require File.expand_path '../../application.rb', __FILE__

module RSpecConfig
  include Rack::Test::Methods
  def application
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecConfig }

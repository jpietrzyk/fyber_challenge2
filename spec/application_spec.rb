require File.expand_path '../spec_helper.rb', __FILE__
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

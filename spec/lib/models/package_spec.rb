require File.expand_path '../../../spec_helper.rb', __FILE__
ENV['RACK_ENV'] = 'test'

describe 'Package' do
  include Rack::Test::Methods
  def application
    Sinatra::Application
  end
end

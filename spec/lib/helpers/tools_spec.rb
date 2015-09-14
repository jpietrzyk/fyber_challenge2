require File.expand_path '../../../spec_helper.rb', __FILE__
ENV['RACK_ENV'] = 'test'

describe 'Tools' do
  include Rack::Test::Methods

  def application
    Sinatra::Application
  end

  describe 'package_info' do
    it 'should get package and create version' do
      pkg = Package.new
      application.get_info_from_package('ACD', '1.5.3', pkg)
    end
  end
end

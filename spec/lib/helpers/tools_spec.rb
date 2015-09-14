require File.expand_path '../../../spec_helper.rb', __FILE__
ENV['RACK_ENV'] = 'test'

describe "Tools" do
	include Rack::Test::Methods

	def application
		Sinatra::Application
	end

	describe "package_info" do
		before do
			package = File.dirname(__FILE__) + '/ACD_1.5.3.tar.gz'
			
		end
		it "should get package and create version" do
			pkg = Package.new
			application.package_info("ACD", "1.5.3", pkg)
		end
	end

end

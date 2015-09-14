require File.expand_path '../spec_helper.rb', __FILE__
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

describe 'Application' do
  include Rack::Test::Methods
  include Tools

  def app
    Sinatra::Application
  end

  before :each do
    (1..4).each do |i|
      pkg = Package.create! name: "package#{i}"
      authors = []
      (1..3).each do |a|
        authors << Author.create(name: "Author #{a}")
      end
      maintainer = authors.first;
      pkg.package_versions.create!(version: "2.3", description: "Package description", title: "Package title", publication_date: Time.now, 
                                   authors: authors, maintainer: maintainer)
    end
  end

  describe "GET /packages" do
    it 'show all packages' do
      pkg = Package.first
      pkg_version = pkg.package_versions.first
      get '/packages'
    end
  end

  describe "GET /packages/:package_id" do
    it "shows package info" do
      pkg = Package.first
      pkg_version = pkg.package_versions.first
      get "/packages/#{pkg.id}"
      expect(last_response.body).to include(pkg.name)
      expect(last_response.body).to include(pkg_version.version)
    end
  end
end
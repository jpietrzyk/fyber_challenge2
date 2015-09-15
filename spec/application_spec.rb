require File.expand_path '../spec_helper.rb', __FILE__

describe 'Application' do
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
      maintainer = authors.first
      pkg.package_versions.create!(version: '2.3', description: 'Package description', title: 'Package title', publication_date: Time.now,
                                   authors: authors, maintainer: maintainer)
    end
  end

  describe 'GET /packages' do
    it 'show all packages' do
      get '/packages'
      expect(last_response.status).to be(200)
    end
  end
end

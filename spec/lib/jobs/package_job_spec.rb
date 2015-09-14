require File.expand_path '../../../spec_helper.rb', __FILE__
ENV['RACK_ENV'] = 'test'

describe 'Jobs::PackageJob' do
  include Rack::Test::Methods
  include Tools

  def application
    Sinatra::Application
  end
  describe 'run' do
    before do
      packages = [{'Package' => 'ACD', 'Version' => '1.5.3', 'Depends' => 'R(>= 2.13.0)', 'License' => 'GPL (>= 2)', 'NeedsCompilation' => 'no'}]
      packade_details = package_details = { 'Package' => 'ACD', 'Version' => '1.5.3', 'Date' => '2013-30-10', 'Title' => 'Categorical data analysis with complete or missing responses', 'Author' => 'Frederico Zanqueta Poleto, Julio da Mota Singer, Carlos Daniel Paulino, Fabio Mathias Correa and Enio Galinkin Jelihovschi', 'Maintainer' => 'Fabio Mathias Correa <fmcorrea@uesc.br>', 'Description' => 'Categorical data analysis with complete or missing responses', 'Depends' => 'R(>= 2.13.0)', 'License' => 'GPL (>= 2)', 'Repository' => 'CRAN', 'Date/Publication' => '2013-10-31 20:59:03', 'Packaged' => '2013-10-31 19:00:13 UTC; fmcron', 'NeedsCompilation' => 'no' }
      allow(Jobs::PackageJob).to receive(:all_packages).and_yield(packages)
      allow(Jobs::PackageJob).to receive(:get_info_from_package).and_return(package_details)
    end
    context 'package exists' do
      before do
        pkg = Package.new
        allow(Package).to receive_message_chain(:where, :first).and_return(pkg)
        allow(pkg).to receive_message_chain(:package_versions, :where, :empty?).and_return(false)
      end
      context "package version doesnt exist" do
        it 'create new package version' do
          Jobs::PackageJob.run application.settings
        end
      end
    end

    context 'package doesn\'t exists' do
      before do
        allow(Package).to receive_message_chain(:where, :first).and_return(nil)
        expect(Package).to receive(:create)
      end
      it 'create package' do
        Jobs::PackageJob.run application.settings
      end
    end
  end
end

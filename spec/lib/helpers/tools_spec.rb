require File.expand_path '../../../spec_helper.rb', __FILE__

describe 'Tools' do
  describe 'package_info' do
    it 'should get package and create version' do
      pkg = Package.new
      application.get_info_from_package('ACD', '1.5.3', pkg, application.settings)
    end
  end

  describe 'create_version' do
    let(:package_details) do
      {
        'Package' => 'ACD',
        'Version' => '1.5.3',
        'Date' => '2013-30-10',
        'Title' => 'Categorical data analysis with complete or missing responses',
        'Author' => 'Frederico Zanqueta Poleto, Julio da Mota Singer, Carlos Daniel Paulino, Fabio Mathias Correa and Enio Galinkin Jelihovschi',
        'Maintainer' => 'Fabio Mathias Correa <fmcorrea@uesc.br>',
        'Description' => 'Categorical data analysis with complete or missing responses',
        'Depends' => 'R(>= 2.13.0)',
        'License' => 'GPL (>= 2)',
        'Repository' => 'CRAN',
        'Date/Publication' => '2013-10-31 20:59:03',
        'Packaged' => '2013-10-31 19:00:13 UTC; fmcron',
        'NeedsCompilation' => 'no'
      }
    end
    it 'should create new package without versions' do
      pkg = Package.create name: 'Test Package'
      expect(pkg.package_versions.empty?).to eq(true)
    end
    it 'should create new package version via package' do
      pkg = Package.create name: 'Test Package'
      pkg.create_version package_details
      expect(pkg.reload.package_versions.empty?).to eq(false)
    end
  end

  describe 'all_packages' do
    before do
      response_object = Net::HTTPOK.new('1.1', 200, 'OK')
      allow(response_object).to receive_messages(body: {})
    end
    it 'return all packages' do
      expect { |block| application.all_packages(application.settings, &block) }.to yield_control
    end
  end
end

require File.expand_path '../../../spec_helper.rb', __FILE__
ENV['RACK_ENV'] = 'test'

describe PackageVersion.new(version: '1.6',
                            publication_date: '18-12-1982 00:00:00',
                            title: 'Version Title',
                            dependencies: 'Other Packages',
                            description: 'Version description',
                            repository: 'CRAN',
                            license: 'GPL') do
  context 'schema' do
    it { is_expected.to have_attributes(version: '1.6') }
    it { is_expected.to have_attributes(publication_date: '18-12-1982'.to_datetime) }
    it { is_expected.to have_attributes(title: 'Version Title') }
    it { is_expected.to have_attributes(dependencies: 'Other Packages') }
    it { is_expected.to have_attributes(description: 'Version description') }
    it { is_expected.to have_attributes(repository: 'CRAN') }
    it { is_expected.to have_attributes(license: 'GPL') }
  end
end

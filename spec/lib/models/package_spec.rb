require File.expand_path '../../../spec_helper.rb', __FILE__
ENV['RACK_ENV'] = 'test'

describe Package.new(name: 'Test package') do
  context 'schema' do
    it { is_expected.to have_attributes(name: 'Test package') }
  end
end

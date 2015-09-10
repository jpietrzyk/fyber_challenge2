require File.expand_path '../../../spec_helper.rb', __FILE__
ENV['RACK_ENV'] = 'test'

describe Author.new(name: 'Test author', email: 'testauthor@domain.com') do
  context 'schema' do
    it { is_expected.to have_attributes(name: 'Test author') }
    it { is_expected.to have_attributes(email: 'testauthor@domain.com') }
  end
end

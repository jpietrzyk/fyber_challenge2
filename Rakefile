# Encoding: utf-8

require 'rubocop/rake_task'
require 'rspec/core/rake_task'

task default: :build

task build: [:clean, :prepare, :unit, :system, :quality]

desc 'Runs standard build activities.'
task build_full: [:build]

desc 'Code quality check'
RuboCop::RakeTask.new(:quality)

desc 'Removes the build directory.'
task :clean do
  FileUtils.rm_rf 'build'
end
desc 'Creates a basic build directory.'
task :prepare do
  FileUtils.mkdir_p('build/spec')
end

def get_rspec_flags(log_name, others = nil)
  "--format documentation --out build/spec/#{log_name}.log --format html --out build/spec/#{log_name}.html --format progress #{others}"
end

RSpec::Core::RakeTask.new(:unit) do |t|
  ENV['TEST_TYPE'] = 'unit'
  ENV['COVERAGE'] = 'true'
  t.pattern = FileList['spec/unit/**/*_spec.rb']
  t.rspec_opts = get_rspec_flags('unit')
end

RSpec::Core::RakeTask.new(:system) do |t|
  ENV['TEST_TYPE'] = 'system'
  t.pattern = FileList['spec/system/**/*_spec.rb']
  t.rspec_opts = get_rspec_flags('system')
end

namespace :db do
  desc 'migrate your database'
  task :migrate do
    require 'bundler'
    Bundler.require
    require './lib/db_config'
    require './config/environment'
    ActiveRecord::Migrator.migrate('db/migrate')
  end
end

task :refresh_packages do
  require './application'
  Jobs::PackageJob.run settings
end

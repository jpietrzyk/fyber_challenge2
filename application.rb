#!/usr/bin/env ruby

require 'sinatra'
require 'active_record'
require 'open-uri'
require 'rubygems/package'
require 'dcf'
require 'tilt/haml'
$LOAD_PATH << File.join(File.dirname(File.realpath(__FILE__)), 'lib')
$ROOT = File.dirname(File.realpath(__FILE__))
require 'db_config'

require_relative 'config/config'
require_relative 'config/environment.rb'
require 'models'
require 'helpers'
require 'jobs'
require 'workers'

after do
  ActiveRecord::Base.clear_active_connections!
end

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0
include Tools

get '/' do
  @package_versions = PackageVersion.all
  haml :index
end

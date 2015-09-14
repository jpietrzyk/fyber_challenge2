#!/usr/bin/env ruby

require 'sinatra'
require 'active_record'
require 'open-uri'
require 'rubygems/package'
require 'dcf'
$LOAD_PATH << File.join(File.dirname(File.realpath(__FILE__)), 'lib')
$ROOT = File.dirname(File.realpath(__FILE__))
require 'db_config'

require_relative 'config/config'
require_relative 'config/environment.rb'
require 'models'
require 'helpers'
require 'jobs'

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0
include Tools


get '/packages' do
  @packages = Package.all
end

get '/packages/:id' do
  @package = Package.where(id: params[:id]).first
  if @package
    @package_versions = @package.package_versions if @package
  else
    @message = "Package not found"
    @packages = Package.all
  end
end
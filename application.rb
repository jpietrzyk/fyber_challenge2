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
include Tools

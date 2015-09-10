#!/usr/bin/env ruby

require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'fyber_challenge2.sqlite3.db'
)

require 'bundler/setup'

Bundler.require :default

use ActiveRecord::ConnectionAdapters::ConnectionManagement

require File.expand_path("../src/api", __FILE__)

run Api.new

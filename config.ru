# config.ru (run with rackup)
require 'csv2api'
require 'bundler'

run CSV2API::Server

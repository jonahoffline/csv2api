$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
ENV['RACK_ENV'] = 'test'
ENV['CSV2API_ROOT'] = 'spec/fixtures'

require 'simplecov'
require 'rack/test'

SimpleCov.start
require 'csv2api'

RSpec.configure do |config|
  config.order = 'random'
end

def load_fixture(csv_file)
  path = File.join(File.dirname(__FILE__), 'fixtures', "#{csv_file}.csv")
  File.read(path)
end

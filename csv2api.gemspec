# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv2api/version'

Gem::Specification.new do |spec|
  spec.name          = 'csv2api'
  spec.version       = CSV2API::VERSION
  spec.authors       = ['Jonah Ruiz']
  spec.email         = ['jonah@pixelhipsters.com']
  spec.description   = %q(Auto-create json & xml APIs endpoints from csv files.)
  spec.summary       = %q(Auto-create API endpoints from csv files.)
  spec.homepage      = 'https://github.com/jonahoffline/csv2api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov', '~> 0.8.2'
  spec.add_development_dependency 'rack-test', '~> 0.6.2'

  spec.add_dependency 'sinatra', '~> 1.4.5'
  spec.add_dependency 'activesupport', '~> 4.1.1'
  spec.add_dependency 'builder', '~> 3.2.2'
end

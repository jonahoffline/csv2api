require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec
task test: :spec

desc 'Run Rubocop with configuration file'
task :rubocop do
  exec('rubocop -c .rubocop.yml')
end

desc 'Check documentation with inch'
task :docs do
  exec('inch diff && inch list')
end

desc 'Run YARD server'
task :doc do
  exec('yard server --reload & open http://localhost:8808')
end

desc 'Kill YARD Server'
task :kill_yard do
  exec('pgrep yard | xargs kill -9')
end

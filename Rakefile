require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :console do
  sh "bundle exec irb -rubygems -I lib -r saas_runner.rb"
end

RSpec::Core::RakeTask.new(:spec)

task default: [:spec]

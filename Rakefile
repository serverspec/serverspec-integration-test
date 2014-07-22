require 'rake'
require 'rspec/core/rake_task'

task :spec => "spec:all"

namespace :spec do
  hosts = %w( centos65 ubuntu1404 fedora20 )

  task :all => hosts

  hosts.each do |host|
    RSpec::Core::RakeTask.new(host.to_sym) do |t|
      puts "Running tests to #{host} ..."
      ENV["HOST"] = host
      t.pattern = "spec/*_spec.rb"
    end
  end
end

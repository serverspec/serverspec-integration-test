require 'rake'
require 'rspec/core/rake_task'

task :spec => "spec:all"

namespace :spec do
  hosts = %w( centos65 centos70 ubuntu1404 )

  task :all => hosts

  hosts.each do |host|
    RSpec::Core::RakeTask.new(host.to_sym) do |t|
      puts "Running tests to #{host} ..."
      ENV["TARGET_HOST"] = host
      t.pattern = "spec/*_spec.rb"
    end
  end

  RSpec::Core::RakeTask.new(:freebsd) do |t|
    puts "Running tests to freebsd ..."
    ENV["TARGET_HOST"] = 'freebsd'
    t.pattern = "spec/freebsd/*_spec.rb"
  end
end

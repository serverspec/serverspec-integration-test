require 'rake'
require 'rspec/core/rake_task'

task :spec => "spec:all"

namespace :spec do
  hosts = %w( centos65 ubuntu1310 )

  task :all => hosts

  hosts.each do |host|
    RSpec::Core::RakeTask.new(host.to_sym) do |t|
      ENV["HOST"] = host
      t.pattern = "spec/*_spec.rb"
    end
  end
end

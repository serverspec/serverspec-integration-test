#!/usr/bin/env ruby

require 'itamae'

host = ARGV[0]

config = Tempfile.new('', Dir.tmpdir)
`vagrant ssh-config #{host} > #{config.path}`

options = Net::SSH::Config.for(host, [config.path])

options[:host] = options.delete(:host_name)
options[:key]  = options[:keys][0]

Itamae::Runner.run(['recipe.rb'], :ssh, options)

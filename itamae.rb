#!/usr/bin/env ruby

require 'itamae'

recipe_files = Dir.glob('recipes/*.rb')

host = ARGV[0]

config = Tempfile.new('', Dir.tmpdir)
`vagrant ssh-config #{host} > #{config.path}`

options = Net::SSH::Config.for(host, [config.path])

options[:host] = options.delete(:hostname)
options[:key]  = options[:keys][0]

Itamae::Runner.run(recipe_files, :ssh, options)

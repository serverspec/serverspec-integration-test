$:.unshift "../serverspec/lib"
$:.unshift "../specinfra/lib"

require 'serverspec'

include Specinfra::Helper::Ssh
include Specinfra::Helper::DetectOS

RSpec.configure do |c|
  options = {}
  host    = ""
  config  = `vagrant ssh-config #{ENV["HOST"]}`
  config.each_line do |line|
    if match = /HostName (.*)/.match(line)
      host = match[1]
    elsif match = /User (.*)/.match(line)
      options[:user] = match[1]
    elsif match = /IdentityFile (.*)/.match(line)
      options[:keys] =  [match[1].gsub(/"/,'')]
    elsif match = /Port (.*)/.match(line)
      options[:port] = match[1]
    end
  end
  set :host, host
  set :ssh_options, options
end

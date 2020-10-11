require 'spec_helper'

res = Specinfra::Runner.run_command('netstat -rn | grep ^0.0.0.0').stdout.split(/\s+/)

describe default_gateway do
  xits(:ipaddress) { should eq res[1] }
  xits(:interface) { should eq res[7] }
end

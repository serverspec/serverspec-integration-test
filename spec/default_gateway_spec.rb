require 'spec_helper'

runner = Specinfra::Runner.instance
res = runner.run_command('netstat -rn | grep ^0.0.0.0').stdout.split(/\s+/)

describe default_gateway do
  its(:ipaddress) { should eq res[1] }
  its(:interface) { should eq res[7] }
end






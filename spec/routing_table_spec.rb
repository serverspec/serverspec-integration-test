require 'spec_helper'

res = Specinfra::Runner.run_command('netstat -rn | grep ^0.0.0.0').stdout.split(/\s+/)

describe routing_table do
  xit do
    should have_entry(
      :destination => 'default',
      :interface   => res[7],
      :gateway     => res[1],
    )
  end
end

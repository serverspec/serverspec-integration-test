require 'spec_helper'

runner = Specinfra::Runner.instance
res = runner.run_command('netstat -rn | grep ^0.0.0.0').stdout.split(/\s+/)

describe routing_table do
  it do
    should have_entry(
      :destination => 'default',
      :interface   => res[7],
      :gateway     => res[1],
    )
  end
end

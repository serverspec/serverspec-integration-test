require 'spec_helper'

speed  = backend.get_interface_speed_of('eth0').stdout.strip.to_i
ipaddr = backend.run_command("ip addr show eth0 | grep 'inet ' | awk '{print $2}'").stdout.strip

describe interface('eth0') do
  if ! ENV['WERCKER']
    its(:speed) { should eq speed }
  end

  it { should have_ipv4_address(ipaddr) }
end

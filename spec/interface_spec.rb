require 'spec_helper'

os = backend.check_os

nic = ''

if os[:family] == 'Fedora'
  nic = 'p2p1'
else
  nic = 'eth0'
end

speed  = backend.get_interface_speed_of(nic).stdout.strip.to_i
ipaddr = backend.run_command("ip addr show #{nic} | grep 'inet ' | awk '{print $2}'").stdout.strip

describe interface(nic) do
  if ! ENV['WERCKER']
    its(:speed) { should eq speed }
  end

  it { should have_ipv4_address(ipaddr) }
end

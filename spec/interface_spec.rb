require 'spec_helper'

if os[:family] == 'redhat' && os[:release].to_i == 7
  i = 'enp0s3'
else
  p = 'eth0'
end

speed  = backend.get_interface_speed_of(i).stdout.strip.to_i
ipaddr = backend.run_command("ip addr show #{i} | grep 'inet ' | awk '{print $2}'").stdout.strip

describe interface(i) do
  if ! ENV['WERCKER']
    its(:speed) { should eq speed }
  end

  it { should have_ipv4_address(ipaddr) }
end

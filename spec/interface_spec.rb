require 'spec_helper'

i = Specinfra::Runner.run_command("ifconfig | head -1 | awk '{ print $1}' | sed -e 's/://'").stdout.strip

speed  = Specinfra::Runner.get_interface_speed_of(i).stdout.strip.to_i
ipaddr = Specinfra::Runner.run_command("ip addr show #{i} | grep 'inet ' | awk '{print $2}'").stdout.strip

describe interface(i) do
  if ! ENV['DIGITALOCEAN']
    its(:speed) { should eq speed }
  end

  it { should have_ipv4_address(ipaddr) }
end

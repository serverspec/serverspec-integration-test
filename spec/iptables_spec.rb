require 'spec_helper'

Specinfra::Runner.run_command('iptables -A INPUT -s 192.168.100.100 -j DROP')

describe iptables do
  it { should have_rule('-A INPUT -s 192.168.100.100/32 -j DROP') }
  it { should have_rule('-P INPUT ACCEPT').with_table('mangle').with_chain('INPUT') }
end

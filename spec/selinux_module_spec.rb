require 'spec_helper'

describe selinux_module('dnsmasq'), if: os[:family] == 'redhat' do
  it { should be_installed }
  it { should be_enabled }
end

require 'spec_helper'

describe selinux_module('dnsmasq'), if: os[:family] == 'redhat' do
  xit { should be_installed }
  xit { should be_enabled }
end

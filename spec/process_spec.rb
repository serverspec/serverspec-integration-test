require 'spec_helper'

if os[:family] == 'redhat' && os[:release].to_i == 7
  p = 'systemd'
else
  p = 'init'
end

describe process(p) do
  it { should be_running }
  its(:user)  { should eq 'root' }
  its(:group) { should eq 'root' }
end

describe process('memcached') do
  it { should be_running }
  its(:args) { should match /-p 11211/ }
end

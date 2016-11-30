require 'spec_helper'

def rhel7?
  host_inventory['platform'] == 'redhat' && host_inventory['platform_version'].to_i == 7
end

describe port(22) do
  it { should be_listening }
  it { should be_listening.with('tcp') }
  it { should be_listening.on('0.0.0.0') }
end

describe port(53) do
  it { should be_listening }

  context 'ss in rhel7 has a bug that the netid shows "tcp" always' do
    it 'If rhel7, skip this test', :unless => rhel7? do
      should be_listening.with('udp')
    end
  end

  it { should be_listening.with('tcp') }
end

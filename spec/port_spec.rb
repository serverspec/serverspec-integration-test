require 'spec_helper'

describe port(22) do
  it { should be_listening }
  it { should be_listening.with('tcp') }
  it { should be_listening.on('127.0.0.1') }
end

describe port(53) do
  it { should be_listening }
  it { should be_listening.with('udp') }
  it { should be_listening.with('tcp') }
  it { should be_listening.on('127.0.0.1') }
end

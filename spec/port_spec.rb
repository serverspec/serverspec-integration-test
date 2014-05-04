require 'spec_helper'

describe port(22) do
  it { should be_listening }
  it { should be_listening.with('tcp') }
end

describe port(111) do
  it { should be_listening }
  it { should be_listening.with('udp') }
end

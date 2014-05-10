require 'spec_helper'

describe file('/etc/redhat-release'), if: os[:family] == 'RedHat' do
  it { should be_file }
end

describe file('/etc/debian_version'), if: os[:family] == 'Ubuntu' do
  it { should be_file }
end

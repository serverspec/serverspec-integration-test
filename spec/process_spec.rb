require 'spec_helper'

describe process('init') do
  it { should be_running }
  its(:user)  { should eq 'root' }
  its(:group) { should eq 'root' }
end

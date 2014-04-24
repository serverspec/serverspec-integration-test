require 'spec_helper'

describe host('example.jp') do
  it { should be_resolvable }
  its(:ipaddress) { should eq '1.2.3.4' }
end

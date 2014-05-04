require 'spec_helper'

describe host('example.jp') do
  it { should be_resolvable }
  its(:ipaddress) { should eq '1.2.3.4' }

  it { should be_resolvable.by('hosts') }
end

describe host('www.google.com') do
  it { should     be_resolvable             }
  it { should     be_resolvable.by('dns')   }
  it { should_not be_resolvable.by('hosts') }
end

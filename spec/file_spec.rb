require 'spec_helper'

describe file('/etc/passwd') do
  it { should be_file }
  it { should contain 'root:x:0:0:root:/root:/bin/bash' }
  it { should be_mode '644' }

  it { should be_readable.by(:owner) }
  it { should be_readable.by(:group) }
  it { should be_readable.by(:others) }

  it { should     be_writable.by(:owner) }
  it { should_not be_writable.by(:group) }
  it { should_not be_writable.by(:others) }

  it { should_not be_executable.by(:owner) }
  it { should_not be_executable.by(:group) }
  it { should_not be_executable.by(:others) }

  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/var/run/rpcbind.sock') do
  xit { should be_socket }
end

describe file('/var/tmp/named.pipe') do
  it { should be_pipe }
end

describe file('/tmp') do
  it { should be_directory }
end

describe file('/tmp-link') do
  it { should be_linked_to '/tmp' }
end

describe file('/etc/passwd') do
  it { should be_readable }
end

describe file('/etc/shadow') do
  it { should be_readable.by_user('root') }
  it { should_not be_readable.by_user('daemon') }
end

describe file('/tmp') do
  it { should be_writable }
end

describe file('/etc/sudoers') do
  it { should be_writable.by_user('root') }
  it { should_not be_writable.by_user('daemon') }
end

describe file('/bin/ls') do
  it { should be_executable }
end

describe file('/var/test.sh') do
  it { should be_executable.by_user('root') }
  it { should_not be_executable.by_user('daemon') }
  its(:md5sum) { should eq '098f6bcd4621d373cade4e832627b4f6' }
  its(:sha256sum) { should eq '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08' }
  its(:content) { should match /test/ }
end

describe file('/tmp/wercker.yml') do
  before do
    Specinfra::Runner.send_file('wercker.yml', '/tmp/wercker.yml')
  end
  it { should be_file }
end

describe file('/var/test.conf') do
  it { should_not contain('StartServers 5').from(/^<IfModule>/).to(/^<\/IfModule>/) }
end

describe file('/var/test.conf') do
  it { should contain('StartServers 100').from(/^<IfModule>/).to(/^<\/IfModule>/) }
end

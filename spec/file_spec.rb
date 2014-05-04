require 'spec_helper'

describe file('/etc/passwd') do
  it { should be_file }
  it { should contain 'root:x:0:0:root:/root:/bin/bash' }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/var/run/rpcbind.sock') do
  xit { should be_socket }
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
  it { should match_md5checksum '098f6bcd4621d373cade4e832627b4f6' }
  it { should match_sha256checksum '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08' }
  its(:content) { should match /test/ }
end

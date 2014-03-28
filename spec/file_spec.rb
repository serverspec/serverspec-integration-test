require 'spec_helper'

describe file('/etc/passwd') do
  it { should be_file }
  it { should contain 'root:x:0:0:root:/root:/bin/bash' }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/var/run/rpcbind.sock') do
  it { should be_socket }
end

describe file('/tmp') do
  it { should be_directory }
end

describe file('/tmp-link') do
  it { should be_linked_to '/tmp' }
end

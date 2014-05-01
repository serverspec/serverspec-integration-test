require 'spec_helper'

describe linux_kernel_parameter('net.ipv4.tcp_syncookies') do 
  its(:value) { should eq 1 }
end

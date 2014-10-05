require 'spec_helper'

describe selinux_module('bootloader') do
  it { should be_installed }
  it { should be_enabled }
end

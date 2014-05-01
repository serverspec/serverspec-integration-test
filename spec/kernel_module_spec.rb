require 'spec_helper'

describe kernel_module('ext4') do
  it { should be_loaded }
end

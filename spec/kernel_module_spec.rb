require 'spec_helper'

describe kernel_module('ip_tables') do
  it { should be_loaded }
end

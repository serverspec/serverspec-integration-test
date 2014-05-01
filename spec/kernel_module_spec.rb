require 'spec_helper'

describe kernel_module('drm') do
  it { should be_loaded }
end

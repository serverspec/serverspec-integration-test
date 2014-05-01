require 'spec_helper'

backend.run_command('modprobe drm')

describe kernel_module('drm') do
  it { should be_loaded }
end

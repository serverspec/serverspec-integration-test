require 'spec_helper'

Specinfra::Runner.run_command('modprobe drm')

describe kernel_module('drm') do
  it { should be_loaded }
end

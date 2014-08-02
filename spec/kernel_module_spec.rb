require 'spec_helper'

runner = Specinfra::Runner.instance
runner.run_command('modprobe drm')

describe kernel_module('drm') do
  it { should be_loaded }
end

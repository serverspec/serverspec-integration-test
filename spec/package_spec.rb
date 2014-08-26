require 'spec_helper'

version = Specinfra::Runner.get_package_version('dnsmasq').stdout

describe package('dnsmasq') do
  it { should     be_installed }
  it { should     be_installed.with_version(version) }
  it { should_not be_installed.with_version('0.0.0.0') }
end

describe package('foo') do
  it { should_not be_installed }
end

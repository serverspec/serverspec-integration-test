require 'spec_helper'

describe command('cat /var/test.sh') do
  it { should return_stdout 'test' }
  it { should return_exit_status 0 }
  its(:stdout) { should match /test/ }
end

describe command('cat /not_exist') do
  it { should return_stderr /No such file or directory/ }
  it { should return_exit_status 1 }
end

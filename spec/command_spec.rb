require 'spec_helper'

describe command('cat /var/test.sh') do
  its(:stdout) { should match /test/ }
  its(:exit_status) { should eq 0 }
end

describe command('cat /not_exist') do
  its(:stderr) { should match /No such file or directory/ }
  its(:exit_status) { should eq 1 }
end

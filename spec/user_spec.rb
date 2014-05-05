require 'spec_helper'

describe user('root') do
  it { should exist }
  it { should belong_to_group 'root' }
  it { should have_uid 0 }
  it { should have_home_directory '/root' }
  it { should have_login_shell '/bin/bash' }
end

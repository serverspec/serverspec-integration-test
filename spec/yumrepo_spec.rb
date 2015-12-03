require 'spec_helper'

describe yumrepo('extras') do
  it { should be_exist   }
  it { should be_enabled }
end

describe yumrepo('C6.0') do
  it { should_not exist }
end

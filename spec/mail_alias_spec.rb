require 'spec_helper'

describe mail_alias('daemon') do
  it { should be_aliased_to 'root' }
end

require 'spec_helper'

describe mail_alias('foo') do
  it { should be_aliased_to 'bar' }
end

require 'spec_helper'

describe group('root') do
  it { should exist      }
  it { should have_gid 0 }
end

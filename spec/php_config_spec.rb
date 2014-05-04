require 'spec_helper'

describe php_config('default_mimetype') do
  its(:value) { should eq 'text/html' }
end

require 'spec_helper'

describe 'curl custtom type' do
  it 'responds at root' do
    expect(curl 'localhost/').to be_ok
  end

  it 'does not respond at ssl' do
    expect(curl 'https://localhost/').to_not be_ok
  end

  it 'does not respond at other uri' do
    expect(curl 'localhost/doc/somewhere404').to_not be_ok
  end

  it 'does not respond at port 8123' do
    expect(curl 'localhost:8123/').to_not be_ok
  end

  it 'reponds at loopback address' do
    expect(curl '127.0.0.1').to be_ok
  end
end

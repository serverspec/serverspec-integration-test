require 'serverspec'
require 'winrm'

set :backend, :winrm

opts = {
  endpoint: 'http://127.0.0.1:5985/wsman',
  user: 'appveyor',
  password: ENV['WINDOWS_PASSWORD'],
  operation_timeout: 300 # 5 minutes max timeout for any operation
}
Specinfra.configuration.winrm = WinRM::Connection.new(opts)

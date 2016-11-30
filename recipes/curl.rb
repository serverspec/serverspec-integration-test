if node[:platform] == 'ubuntu'
  package 'nginx'

  service 'nginx' do
    action :start
  end
end

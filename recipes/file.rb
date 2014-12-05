link '/tmp-link' do
  to '/tmp'
end

file '/var/test.sh' do
  owner 'root'
  group 'root'
  mode  '0700'
  action :create
  content 'test'
end

file '/var/test.conf' do
  content <<-EOF
<IfModule>
StartServers 100
</IfModule>

<IfModule>
StartServers 5
EOF
end

file '/tmp/hoge' do
  action :delete
end

execute '/tmp/named.pipe' do
  command 'mkfifo /tmp/named.pipe'
end

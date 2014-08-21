execute 'echo 1.2.3.4    example.jp >> /etc/hosts' do
  not_if 'grep "1.2.3.4" /etc/hosts'
end


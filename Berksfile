site :opscode

%w( selinux hosts file cron package alias ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end

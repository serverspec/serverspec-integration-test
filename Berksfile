site :opscode

%w( dnsmasq hosts file cron package alias ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end

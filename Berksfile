site :opscode

%w( hosts file cron package ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end


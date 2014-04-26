site :opscode

%w( hosts file cron ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end


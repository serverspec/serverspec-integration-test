source "https://api.berkshelf.com"

%w( cron ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end


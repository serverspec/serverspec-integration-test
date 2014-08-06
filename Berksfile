source "https://api.berkshelf.com"

%w( hosts file cron package ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end

cookbook 'selinux'

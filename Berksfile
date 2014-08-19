source "https://api.berkshelf.com"

%w( hosts cron package ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end

cookbook 'selinux'

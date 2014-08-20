source "https://api.berkshelf.com"

%w( hosts cron ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end

cookbook 'selinux'

source "https://api.berkshelf.com"

%w( selinux hosts file cron package alias ).each do |type|
  cookbook type, path: "./site-cookbooks/#{type}"
end

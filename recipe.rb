include_recipe 'recipes/file.rb'
include_recipe 'recipes/hosts.rb'
include_recipe 'recipes/mail_alias.rb'
include_recipe 'recipes/package.rb'
include_recipe 'recipes/cron.rb'
if node[:virtualization][:system] != 'docker'
  include_recipe 'selinux::disabled'
end


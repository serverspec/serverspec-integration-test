file '/var/spool/cron/root' do
  content "* * * * * ls /tmp\n"
end

file '/var/spool/cron/daemon' do
  content "* * * * * ls /tmp\n"
end

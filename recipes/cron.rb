if os[:family] == 'redhat'
  file '/var/spool/cron/root' do
    content "* * * * * ls /tmp\n"
  end

  file '/var/spool/cron/daemon' do
    content "* * * * * ls /tmp\n"
  end
end

if os[:family] == 'ubuntu'
  file '/var/spool/cron/crontabs/root' do
    content "* * * * * ls /tmp\n"
  end

  file '/var/spool/cron/crontabs/daemon' do
    content "* * * * * ls /tmp\n"
  end
end

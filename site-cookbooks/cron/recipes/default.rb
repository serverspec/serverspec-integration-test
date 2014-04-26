cron "cron of root user" do
  action :create
  minute  "*"
  hour    "*"
  weekday "*"
  command "ls /tmp"
end

cron "cron of damon user" do
  action :create
  minute  "*"
  hour    "*"
  weekday "*"
  command "ls /tmp"
  user    "daemon"
end


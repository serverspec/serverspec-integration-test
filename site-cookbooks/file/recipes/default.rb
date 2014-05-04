link "/tmp-link" do
  to "/tmp"
end

file "/var/test.sh" do
  owner "root"
  group "root"
  mode  "0700"
  action :create
  content "test"
end


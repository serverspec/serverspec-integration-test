link "/tmp-link" do
  to "/tmp"
end

file "/tmp/test.sh" do
  owner "root"
  group "root"
  mode  "0700"
  action :create
  content "test"
end


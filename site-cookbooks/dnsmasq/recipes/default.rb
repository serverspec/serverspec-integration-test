package "dnsmasq" do
  action :install
end

service "dnsmasq" do
  action [ :enable, :start ]
end

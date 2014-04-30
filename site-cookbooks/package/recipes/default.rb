case node["platform"]
when "redhat", "centos", "fedora"
  package "bind-utils" do
    action :install
  end
end


case node["platform"]
when "redhat", "centos", "fedora"
  package "bind-utils" do
    action :install
  end
end

package "ethtool" do
  action :install
end

package "gawk" do
  action :install
end

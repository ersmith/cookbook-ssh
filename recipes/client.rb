#
# Cookbook Name:: ssh
# Recipe:: client
#
# Copyright 2015, Edward Smith
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# Sets the package name if one isn't specified by the user
if node[:ssh][:client][:package_name].nil?
	case node["platform"]
	when "debian", "ubuntu"
		node.default[:ssh][:client][:package_name] = "openssh-client"
	when "centos", "redhat", "fedora"
		node.default[:ssh][:client][:package_name] = "openssh-clients"
	end
end

# Installs the openssh client
package node[:ssh][:client][:package_name] do
  action :install
end

template "#{node[:ssh][:config_location]}/ssh_config" do
  source 'ssh_config.erb'
  mode '0644'
  owner 'root'
  group 'root'
end
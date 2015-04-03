#
# Cookbook Name:: ssh
# Recipe:: server
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

service_name = "ssh"

case node["platform_family"]
	when "rhel"
		service_name = "sshd"
end

# Installs the openssh server
package node['ssh']['server']['package_name'] do
  action :install
end

# Configures the ssh service to start the ssh service and sets it up to be started at boot.
service service_name do
  if node['ssh']['server']['enable_on_boot']
    action [:enable, :start]
  else
    action :start
  end
end

# Setsup up the sshd configuration
template "#{node['ssh']['config_location']}/sshd_config" do
  source 'sshd_config.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :port => node['ssh']['server']['config']['port'],
    :password_authentication => node['ssh']['server']['config']['password_authentication'],
    :x11_forwarding => node['ssh']['server']['config']['x11_forwarding'],
    :permit_root_login => node['ssh']['server']['config']['permit_root_login']
  })
  notifies :restart, "service[#{service_name}]"
end
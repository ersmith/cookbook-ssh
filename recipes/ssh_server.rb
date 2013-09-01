# Installs the openssh server
package node[:ssh][:server][:package_name] do
  action :install
end

# Configures the ssh service to start the ssh service and sets it up to be started at boot.
service "ssh" do
  if node[:ssh][:server][:enable_on_boot]
    action [:enable, :start]
  else
    action :start
  end
end
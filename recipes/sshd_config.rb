template "#{node[:ssh][:config_location]}/sshd_config" do
  source 'sshd_config.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :port => node[:ssh][:sshd][:port],
    :password_authentication => node[:ssh][:sshd][:password_authentication],
    :x11_forwarding => node[:ssh][:sshd][:x11_forwarding]
  })
  notifies :restart, "service[ssh]"
end
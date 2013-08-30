template "#{node[:ssh][:config_location]}/ssh_config" do
  source 'ssh_config.erb'
  mode '0644'
  owner 'root'
  group 'root'
end
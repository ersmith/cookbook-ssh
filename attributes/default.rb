# General attributes
default[:ssh][:config_location]                 = '/etc/ssh'

# Attributes for the ssh client
default[:ssh][:client][:package_name]           = 'openssh-client'

# Attributes for the ssh server
default[:ssh][:server][:package_name]           = 'openssh-server'
default[:ssh][:server][:enable_on_boot]         = true

# Attributes for the sshd recipe
default[:ssh][:sshd][:port]                     = 22
default[:ssh][:sshd][:x11_forwarding]           = 'no'
default[:ssh][:sshd][:password_authentication]  = 'no'
# General attributes
default['ssh']['config_location']                 = '/etc/ssh'

# Attributes for the ssh client
default['ssh']['client']['package_name']           = nil

# Attributes for the ssh server
default['ssh']['server']['package_name']           = 'openssh-server'
default['ssh']['server']['enable_on_boot']         = true

# Attributes for the sshd recipe
default['ssh']['server']['config']['port']                 		= 22
default['ssh']['server']['config']['x11_forwarding']      		= 'no'
default['ssh']['server']['config']['password_authentication']	= 'no'
default['ssh']['server']['config']['permit_root_login']			= 'no'
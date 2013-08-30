# General attributes
default[:ssh][:config_location] = '/etc/ssh'

# Attributes for the sshd recipe
default[:ssh][:sshd][:port]                    = 22
default[:ssh][:sshd][:x11_forwarding]          = 'no'
default[:ssh][:sshd][:password_authentication] = 'no'
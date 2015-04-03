require 'serverspec'

set :backend, :exec

describe "ssh server"  do
	describe port(22)) do
		it { should be_listening.with('tcp') }
	end

	if ['centos', 'redhat', 'fedora'].include?(os[:family])
		describe process("sshd") do
			it { should be_running }
		end
	else
		describe process("ssh") do
			it { should be_running }
		end
	end

	describe package("openssh-server") do
		it { should be_installed }
	end

	describe file("/etc/ssh/sshd_config") do
		it { should be_file }
		it { should be_owned_by 'root' }
		it { should be_grouped_into 'root' }
		it { should be_mode 0644 }
		it { should contain /^PermitRootLogin no/ }
		it { should contain /^PasswordAuthentication no/ }
		it { should contain /^X11Forwarding no/ }
		it { should contain /^Port 22/ }

	end
end

describe "ssh client" do
	if ['centos', 'redhat', 'fedora'].include?(os[:family])
		describe package("openssh-clients")  do
			it { should be_installed }
		end
	else
		describe package("openssh-client") do
			it { should be_installed }
		end
	end

	describe file("/etc/ssh/ssh_config") do
		it { should be_file }
		it { should be_owned_by 'root' }
		it { should be_grouped_into 'root' }
		it { should be_mode 0644 }
	end
end
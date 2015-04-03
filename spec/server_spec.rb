require 'spec_helper'

describe 'ssh::server' do
	context 'on all' do
		let(:chef_run){ ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04') do |node|
			node.automatic[:ssh][:server][:config][:port] = 2222
		end.converge(described_recipe) }

		it 'should install the ssh server' do
			expect(chef_run).to install_package('openssh-server')
		end

		it 'should create the sshd config file' do
			expect(chef_run).to render_file('/etc/ssh/sshd_config')
		end
	end
end
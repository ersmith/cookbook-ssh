require 'spec_helper'

describe 'ssh::client' do
	context 'on ubuntu' do
		let(:chef_run){ ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }

		it 'should install the ssh client' do
			expect(chef_run).to install_package('openssh-client')
		end
	end

	context 'on centos' do
		let(:chef_run){ ChefSpec::SoloRunner.new(platform: 'centos', version: '6.6').converge(described_recipe) }

		it 'should install the ssh client' do
			expect(chef_run).to install_package('openssh-clients')
		end
	end

	context 'on all' do
		let(:chef_run){ ChefSpec::SoloRunner.new(platform: 'centos', version: '6.6').converge(described_recipe) }

		it 'should create the config file' do
			expect(chef_run).to render_file('/etc/ssh/ssh_config')
		end
	end
end
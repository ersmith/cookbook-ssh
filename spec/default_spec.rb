require 'spec_helper'

describe 'ssh::default' do
	let(:chef_run){ ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }
	
	it 'should include the ssh::client recipe' do
		expect(chef_run).to include_recipe('ssh::client')
	end

	it 'should include the ssh::server recipe' do
		expect(chef_run).to include_recipe('ssh::server')
	end
end
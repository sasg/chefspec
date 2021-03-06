require 'chefspec'

describe 'macports_package::purge' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'mac_os_x', version: '10.12').converge(described_recipe) }

  it 'purges a macports_package with an explicit action' do
    expect(chef_run).to purge_macports_package('explicit_action')
    expect(chef_run).to_not purge_macports_package('not_explicit_action')
  end

  it 'purges a macports_package with attributes' do
    expect(chef_run).to purge_macports_package('with_attributes').with(version: '1.0.0')
    expect(chef_run).to_not purge_macports_package('with_attributes').with(version: '1.2.3')
  end

  it 'purges a macports_package when specifying the identity attribute' do
    expect(chef_run).to purge_macports_package('identity_attribute')
  end
end

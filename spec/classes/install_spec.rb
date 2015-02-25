require 'spec_helper'
describe 'openssh', :type => :class do

  context 'on RedHat systems with default parameters' do
    let (:facts) { {:osfamily => 'RedHat'} }

    it do
      should contain_package('openssh-server').with_ensure('present')
      should contain_package('openssh-clients').with_ensure('present')
    end
  end


  context 'on Debian systems with default parameters' do
    let (:facts) { {:osfamily => 'Debian'} }

    it do
      should contain_package('openssh-server').with_ensure('present')
      should contain_package('openssh-client').with_ensure('present')
    end
  end


  context 'on RedHat systems with specific parameters' do
    let (:facts) { {:osfamily => 'RedHat'} }
    let (:params) {{
      :ensure   => 'latest',
      :packages => [ 'Foo', 'Bar' ],
    }}

    it do
      should contain_package('Foo').with_ensure('latest')
      should contain_package('Bar').with_ensure('latest')
    end
  end

end

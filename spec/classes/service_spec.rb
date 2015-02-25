require 'spec_helper'
describe 'openssh' do

  context 'should start the service on RedHat systems' do
    let (:facts) {{ :osfamily => 'RedHat' }}

    it { should contain_service('sshd').with({
      :ensure     => 'running',
      :enable     => 'true',
      :hasstatus  => 'true',
      :hasrestart => 'true',
    }) }
  end

  context 'should honor custom names' do
    let (:facts) {{ :osfamily => 'RedHat' }}
    let (:params) {{ :servicename => 'foo' }}

    it { should contain_service('foo').with({
      :ensure     => 'running',
      :enable     => 'true',
      :hasstatus  => 'true',
      :hasrestart => 'true',
    }) }
  end

end

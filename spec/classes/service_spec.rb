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

end

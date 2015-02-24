require 'spec_helper'
describe 'openssh', :type => :class do

  context 'should change default and given parameters' do
    let (:facts) { {:osfamily => 'RedHat'} }
    let (:params) { { :config => { 'foo' => 'bar' } } }
    it do
      should contain_augeas('sshd_config').with({
        :changes => [
          'set PermitRootLogin "no"',
          'set foo "bar"',
	]
      })
    end
  end

  context 'should change given parameters and allow changing of default parameters' do
    let (:facts) { {:osfamily => 'RedHat'} }
    let (:params) { { :config => { 'PermitRootLogin' => 'YES', 'foo' => 'bar' } } }
    it do
      should contain_augeas('sshd_config').with({
        :changes => [
          'set PermitRootLogin "YES"',
          'set foo "bar"',
	]
      })
    end
  end

end

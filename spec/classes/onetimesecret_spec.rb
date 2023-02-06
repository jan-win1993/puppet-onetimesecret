require 'spec_helper'

describe 'onetimesecret' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default parameters' do
        let(:params) do
          {
            secret: 'secret',
            redis_password: 'secret',
            version: 'v0.9.2',
          }
        end

        if facts[:kernel] == 'Linux'
          it do  
            is_expected.to contain_class('onetimesecret::service')
          end
        end
        it { is_expected.to compile }

        it { is_expected.to contain_class('onetimesecret::install') }
        it { is_expected.to contain_class('onetimesecret::user') }
        it { is_expected.to contain_class('onetimesecret::config') }
        it { is_expected.to contain_class('onetimesecret::redis') }


        it { is_expected.to contain_file('/etc/onetime').with_ensure('directory') }
        it { is_expected.to contain_file('/etc/onetime/data').with_ensure('directory') }
        it { is_expected.to contain_file('/etc/onetime/config') }

      end
      #context 'with different param' do
      #  let(:params) do
      #    {
      #      secret: 'secret',
      #      redis_password: 'secret',
      #      different_param: 'example',
      #      version: 'v0.9.2',
      #    }
      #  end
    end
  end
end

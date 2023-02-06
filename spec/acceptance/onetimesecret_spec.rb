require 'spec_helper_acceptance'

describe 'nextcloud class' do
  context 'default parameters' do
    it 'is expected to work idempotently with no errors' do
      pp = <<-EOS
      #if $facts['os']['family'] == 'Debian' {
      #  $group_name = 'nogroup'
      #}
      #else {
      #  $group_name = 'nobody'
      #}
      #package { 'bzip2':
      #  ensure => 'present',
      #}
      class { 'onetimesecret':
        redis_password => 'suPeRseCreT',
        secret         => 'secRetPasSwOrd',
        version        => 'v0.9.2',
      }
      EOS
      # Run it twice and test for idempotency
      idempotent_apply(pp)
    end
  end
end

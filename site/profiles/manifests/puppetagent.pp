class profiles::puppetagent {
  exec { 'puppetconf':
      command => 'puppet agent config server puppet-elws.nmt.edu',
      provider => shell
  }
  service { 'puppet':
      ensure => 'running',
      enable => 'true'
  }
}

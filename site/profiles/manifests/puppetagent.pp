class profiles::puppetagent {
  cron { "puppet":
      command => "/usr/bin/puppet agent --server puppet-elws.nmt.edu --onetime --no-daemonize --logdest syslog > /dev/null 2>&1",
      user => "root",
      minute => fqdn_rand( 60 ),
      ensure => present,
  }
}
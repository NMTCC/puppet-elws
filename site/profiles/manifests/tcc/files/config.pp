# class profiles::tcc::files::config

class profiles::tcc::files::config inherits profiles::tcc::files {
  
  file { '/etc/motd':
    source  => [
      "file:///fs/tcc/motd/motd",
      "file:///etc/motd"
    ],
    mode    => '0644',
    require => [
      Service['autofs'],
      Exec['kinit']
    ]
  }
  
  file { '/usr/local/share/forge': ensure => 'directory', }

  configdir { 'profile.d': dest => '/etc', }
  configdir { 'grub2/themes': dest => '/boot/grub2'}
  configdir { 'forge/modules': dest => '/usr/local/share/forge', require => File['/usr/local/share/forge'], }

  nofile { '/etc/sysconfig/desktop': }

  configfile { 'clock': dest => '/etc/sysconfig', }
  configfile { 'lxdm.conf': dest => '/etc/lxdm', }
  configfile { '00-keyboard.conf': dest => '/etc/X11/xorg.conf.d', }
  configfile { 'tcc-reboot': dest => '/etc/cron.d', }
  configfile { 'forge.cron': dest => '/etc/cron.d', }
  configfile { 'sendmail.cf': dest => '/etc/mail', }
  configfile { 'Muttrc.local': dest => '/etc', }
  configfile { 'pine.conf': dest => '/etc', }
  configfile { 'rssh.conf': dest => '/etc', }
  configfile { 'khansub.png': dest => '/usr/share/backgrounds', }
  configfile { 'client.conf': dest => '/etc/cups', }
  configfile { 'smartd.conf': dest => '/etc/smartmontools', }
  configfile { '65-iscan.rules': dest => '/lib/udev/rules.d', }
  configfile { 'apcupsd.conf': dest => '/etc/apcupsd', }
  configfile { 'extlinux.conf': dest => '', mode => '0640', }

  k5login { '/root/.k5login':
    ensure     => 'present',
    principals => [
      'khan@NMT.EDU',
      'ken@NMT.EDU',
      'dgraham@NMT.EDU',
      'dylan@NMT.EDU',
      'wopr@NMT.EDU',
      'odo@NMT.EDU',
      'kaiba@NMT.EDU',
      'jeanluc@NMT.EDU',
      'floomby@NMT.EDU',
      'halycon@NMT.EDU',
    ]
  }

  #Permissions for /usr/local/share/gems needs to be set for users to use
  file { 'gems-directory':
      ensure  => directory,
      path    => '/usr/local/share/gems',
      mode    => '0644',
      recurse => true,
  }

}

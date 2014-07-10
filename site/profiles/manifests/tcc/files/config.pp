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

  configdir { 'config/profile.d': dest => '/etc', }
  configdir { 'config/grub2/themes': dest => '/boot/grub2'}
  configdir { 'config/forge/modules': dest => '/usr/local/share/forge', require => File['/usr/local/share/forge'], }

  nofile { '/etc/sysconfig/desktop': }

  configfile { 'config/clock': dest => '/etc/sysconfig', }
  configfile { 'config/lxdm.conf': dest => '/etc/lxdm', }
  configfile { 'config/00-keyboard.conf': dest => '/etc/X11/xorg.conf.d', }
  configfile { 'config/tcc-reboot': dest => '/etc/cron.d', }
  configfile { 'config/forge.cron': dest => '/etc/cron.d', }
  configfile { 'config/sendmail.cf': dest => '/etc/mail', }
  configfile { 'config/Muttrc.local': dest => '/etc', }
  configfile { 'config/pine.conf': dest => '/etc', }
  configfile { 'config/rssh.conf': dest => '/etc', }
  configfile { 'config/khansub.png': dest => '/usr/share/backgrounds', }
  configfile { 'config/client.conf': dest => '/etc/cups', }
  configfile { 'config/smartd.conf': dest => '/etc/smartmontools', }
  configfile { 'config/65-iscan.rules': dest => '/lib/udev/rules.d', }
  configfile { 'config/apcupsd.conf': dest => '/etc/apcupsd', }
  configfile { 'config/extlinux.conf': dest => '', mode => '0640', }

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

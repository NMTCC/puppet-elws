# class profiles::tcc::files::script

class profiles::tcc::files::script inherits profiles::tcc::files {
  
  ln { '/usr/local/bin/pine': target => '/usr/bin/alpine', }
  ln { '/usr/local/bin/perl': target => '/usr/bin/perl', }
  ln { '/usr/local/bin/python': target => '/usr/bin/python', }
  ln { '/usr/share/backgrounds/default.png': target => '/usr/share/backgrounds/khansub.png', require => Configfile['config/khansub.png'], }
  ln { '/usr/local/bin/grub2': target => '/usr/local/share/forge/modules/grub2', require => Configdir['forge/modules'], }
  ln { '/usr/share/xsessions/default.desktop': target => '/usr/share/xsessions/cinnamon.desktop', }
  
  configscript { 'script/winreboot': dest => '/etc/rc.d/init.d', }
  configscript { 'script/peripheral_check': dest => '/etc/cron.daily', }
  configscript { 'script/overlay': dest => '/etc/cron.daily', }
  configscript { 'script/windisk.sh': dest => '/etc/cron.daily', }
  configscript { 'script/motd': dest => '/usr/bin', }
  configscript { 'script/chsh': dest => '/usr/local/bin', }
  configscript { 'script/set_tcc_os': dest => '/usr/local/bin', }
  configscript { 'script/finger-names': dest => '/usr/local/bin', }
  configscript { 'script/clear_browser_locks': dest => '/usr/local/bin', }
  configscript { 'script/reset_windows': dest => '/usr/local/bin', }
  configscript { 'script/reset_linux': dest => '/usr/local/bin', }
  configscript { 'script/random_machine_reboot': dest => '/usr/local/bin', }
  configscript { 'script/reboot_to_win': dest => '/usr/local/bin', }
  configscript { 'script/reapply': dest => '/usr/local/bin', }
  configscript { 'script/passwd': dest => '/usr/local/bin', }
  configscript { 'script/jpgmpg': dest => '/usr/local/bin', }
  configscript { 'script/make_bootusb': dest => '/usr/local/bin', }
  configscript { 'script/tcc-dracut': dest => '/usr/local/bin', }
  configscript { 'script/PostLogout': dest => '/etc/lxdm', }
  configscript { 'script/sfdisk2parted': dest => '/usr/local/bin', }
  configscript { 'script/killpower': dest => '/etc/apcupsd', }
  configscript { 'script/reseed': dest => '/usr/local/bin', }

  # The 'service' type can't pass --force to the systemctl; this has to be done by exec, then.  Yuck.
  # service { 'lxdm': ensure => 'running', enable => 'true', require => Configfile['lxdm.conf'] }
  profiles::tcc::execlnwrong { 'lxdm-enable': command => '/bin/systemctl enable lxdm.service --force', ln => '/etc/systemd/system/display-manager.service', target => '/usr/lib/systemd/system/lxdm.service', require => Configfile['config/lxdm.conf'] }

  service { 'cups': ensure => 'running', enable => 'true', require => Configfile['config/client.conf'] }
  service { 'puppet': ensure => 'running', enable => 'true', }
  # service { 'transmission-daemon': ensure => 'running', enable => 'true', require => Nofile['/var/lib/transmission/Downloads/Fall2013'], }

  # wget::fetch { 'http://sync.nmt.edu/Spring2014.torrent': destination => '/tmp/Spring2014.torrent', } ->
  # exec { 'ensure transmission':
  #  command => 'transmission-remote -a /tmp/Spring2014.torrent',
  #  unless  => 'transmission-remote -l | grep Spring2014',
  #  path    => '/usr/bin:/usr/sbin:/bin',
  #}
}
# class profiles::tcc::files::script

class profiles::tcc::files::script inherits profiles::tcc::files {
  
  ln { '/usr/local/bin/pine': target => '/usr/bin/alpine', }
  ln { '/usr/local/bin/perl': target => '/usr/bin/perl', }
  ln { '/usr/local/bin/python': target => '/usr/bin/python', }
  ln { '/usr/local/bin/grub2': target => '/usr/local/share/forge/modules/grub2', require => Configdir['forge/modules'], }
  
  configscript { 'winreboot': dest => '/etc/rc.d/init.d', }
  configscript { 'peripheral_check': dest => '/etc/cron.daily', }
  configscript { 'overlay': dest => '/etc/cron.daily', }
  configscript { 'windisk.sh': dest => '/etc/cron.daily', }
  configscript { 'motd': dest => '/usr/bin', }
  configscript { 'chsh': dest => '/usr/local/bin', }
  configscript { 'set_tcc_os': dest => '/usr/local/bin', }
  configscript { 'finger-names': dest => '/usr/local/bin', }
  configscript { 'clear_browser_locks': dest => '/usr/local/bin', }
  configscript { 'reset_windows': dest => '/usr/local/bin', }
  configscript { 'reset_linux': dest => '/usr/local/bin', }
  configscript { 'random_machine_reboot': dest => '/usr/local/bin', }
  configscript { 'reboot_to_win': dest => '/usr/local/bin', }
  configscript { 'reapply': dest => '/usr/local/bin', }
  configscript { 'passwd': dest => '/usr/local/bin', }
  configscript { 'jpgmpg': dest => '/usr/local/bin', }
  configscript { 'make_bootusb': dest => '/usr/local/bin', }
  configscript { 'tcc-dracut': dest => '/usr/local/bin', }
  configscript { 'PostLogout': dest => '/etc/lightdm', }
  configscript { 'sfdisk2parted': dest => '/usr/local/bin', }
  configscript { 'killpower': dest => '/etc/apcupsd', }
  configscript { 'reseed': dest => '/usr/local/bin', }

  # The 'service' type can't pass --force to the systemctl; this has to be done by exec, then.  Yuck.
  # service { 'lxdm': ensure => 'running', enable => 'true', require => Configfile['lxdm.conf'] }
  # profiles::tcc::execlnwrong { 'lxdm-enable': command => '/bin/systemctl enable lxdm.service --force', ln => '/etc/systemd/system/display-manager.service', target => '/usr/lib/systemd/system/lxdm.service', require => Configfile['lxdm.conf'] }

  service { 'cups': ensure => 'running', enable => 'true', require => Configfile['client.conf'] }
  service { 'puppet': ensure => 'running', enable => 'true', }
  service { 'lightdm': ensure => 'running', enable => 'true', }
  # service { 'transmission-daemon': ensure => 'running', enable => 'true', require => Nofile['/var/lib/transmission/Downloads/Fall2013'], }

  # wget::fetch { 'http://sync.nmt.edu/Spring2014.torrent': destination => '/tmp/Spring2014.torrent', } ->
  # exec { 'ensure transmission':
  #  command => 'transmission-remote -a /tmp/Spring2014.torrent',
  #  unless  => 'transmission-remote -l | grep Spring2014',
  #  path    => '/usr/bin:/usr/sbin:/bin',
  #}
}
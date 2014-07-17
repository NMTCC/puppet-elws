# class profiles::tcc::files

class profiles::tcc::files {
  $moduleloc = "puppet:///modules/profiles/${operatingsystem}/config/${operatingsystemrelease}"
  File {
    owner => 'root',
    group => 'root',
    ensure => 'file',
    backup => false,
  }

  define ln ($target) {
    file { $title :
      ensure => 'link',
      target => $target,
    }
  }

  define configfile ($dest, $mode = '0644') {
    file { $title :
      mode   => $mode,
      source => "${profiles::tcc::files::moduleloc}/${$title}",
      path   => "${dest}/${title}",
    }
  }

  define configscript ($dest, $mode = '0755') {
    configfile { $title :
      mode => $mode,
      dest => $dest,
    }
  }

  define emptyfile ($mode = '0644') {
    file { $title :
      mode    => $mode,
      content => '',
    }
  }

  define configdir ($dest, $recurse = 'remote') {
    file { $title :
      source  => "${profiles::tcc::files::moduleloc}/${$title}",
      path    => "${dest}/${title}",
      recurse => $recurse,
      ensure  => 'directory',
      links   => 'manage',
    }
  }

  define nofile () {
    file { $title :
      ensure => 'absent',
      force  => 'true',
    }
  }
}
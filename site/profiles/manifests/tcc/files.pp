# class profiles::tcc::files

class profiles::tcc::files {
  $moduleloc = "puppet:///modules/profiles/${operatingsystem}/config/${operatingsystemreleasemajor}"
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
      source => "${profiles::tcc::files::moduleloc}/config/${$title}",
      path   => "${dest}/${title}",
    }
  }

  define configscript ($dest, $mode = '0755') {
    file { $title :
      mode   => $mode,
      source => "${profiles::tcc::files::moduleloc}/script/${$title}",
      path   => "${dest}/${title}",
    }
  }

  define emptyfile ($mode = '0644') {
    file { $title :
      mode    => $mode,
      content => '',
    }
  }

  define configdir ($dest, $recurse = 'remote') {
    $reg_title = regsubst($title,'^(.*?)([^\/]+$)','\2')
    file { $title :
      source  => "${profiles::tcc::files::moduleloc}/config/${title}",
      path    => "${dest}/${reg_title}",
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
# class profiles::tcc::yum

class profiles::tcc::yum {

	$moduleloc = "puppet:///modules/profiles/${operatingsystem}/yum/${operatingsystemreleasemajor}"

	define gpgrepo ($descr = absent, $baseurl, $gpgkey, $metadata_expire = absent, $enabled = 0, $gpgcheck = 1) {
		yumrepo { $title :
			name => $title,
			descr => $descr,
			baseurl => $baseurl,
			gpgkey => $gpgkey,
			metadata_expire => $metadata_expire,
			enabled => $enabled,
			gpgcheck => $gpgcheck
		}
	}

	define disabledrepo {
		yumrepo { $title :
			name => $title,
			enabled => 0,
		}
	}

	define enabledgpgrepo ($descr = absent, $baseurl, $gpgkey, $metadata_expire = absent, $gpgcheck = 1) {
		gpgrepo { $title :
			descr => $descr,
			baseurl => $baseurl,
			gpgkey => $gpgkey,
			metadata_expire => $metadata_expire,
			enabled => 1,
			gpgcheck => $gpgcheck,
		}
	}

	# App repos
	enabledgpgrepo { 'google-chrome':
		descr => 'google-chrome',
		baseurl => 'http://dl.google.com/linux/chrome/rpm/stable/x86_64/',
		gpgkey => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
	}
	enabledgpgrepo { 'adobe-linux':
		descr => 'Adobe Systems Incorporated',
		baseurl => 'http://linuxdownload.adobe.com/linux/x86_64/',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
	}
	enabledgpgrepo { 'adobe-linux-i386':
		descr => 'Adobe Systems Incorporated',
		baseurl => 'http://linuxdownload.adobe.com/linux/i386/',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
	}
	enabledgpgrepo { 'puppetlabs-products':
		descr => 'Puppet Labs Products CentOS $releasever - $basearch',
		baseurl => 'http://yum.puppetlabs.com/el/$releasever/products/x86_64',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
	}
	enabledgpgrepo { 'puppetlabs-deps':
		descr => 'Puppet Labs Dependencies CentOS $releasever - $basearch',
		baseurl => 'http://yum.puppetlabs.com/el/$releasever/dependencies/x86_64',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
	}

	# TCC repos
	enabledgpgrepo { 'tcc-centos':
		descr => 'TCC CentOS $releasever - $basearch',
		baseurl => 'http://replicon.nmt.edu/centos/7/os/x86_64/Packages/',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7',
		metadata_expire => '1d',
		gpgcheck => 0,
	}
	enabledgpgrepo { 'tcc-centos-debug':
		descr => 'TCC CentOS Debug $releasever - $basearch',
		baseurl => 'http://replicon.nmt.edu/centos-debuginfo/7/x86_64/',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7',
		metadata_expire => '1d',
		gpgcheck => 0,
	}
	package { 'epel-release':
		ensure => present,
		source => 'http://replicon.nmt.edu/epel/7/x86_64/epel-release-7-0.2.noarch.rpm',
		provider => 'rpm',
	}
	package { 'rpmforge':
		ensure => present,
		source => 'http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm',
		provider => 'rpm',
	}

	disabledrepo { 'CentOS-Base': }
	disabledrepo { 'CentOS-Debuginfo': }
	disabledrepo { 'CentOS-Sources': }
	disabledrepo { 'CentOS-Vault': }

	file { '/etc/pki/rpm-gpg':
		ensure => 'directory', recurse => 'remote',
		group => 'root', owner => 'root',
		source => "${moduleloc}",
	}

}

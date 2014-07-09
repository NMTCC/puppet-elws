# class profiles::tcc::yum

class profiles::tcc::yum {

	$moduleloc = "puppet:///modules/profiles/${operatingsystem}/yum/${operatingsystemrelease}"

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
	enabledgpgrepo { 'tcc-centos-development':
		descr => 'TCC CentOS $releasever - $basearch',
		baseurl => 'http://replicon.nmt.edu/centos/linux/development/7/x86_64/os/',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7',
		metadata_expire => '1d',
		gpgcheck => 0,
	}
	package { 'tcc-epel-development':
		ensure => present,
		source => 'http://replicon.nmt.edu/epel/7/x86_64/epel-release-7-0.2.noarch.rpm',
		provider => rpm,
	}

	#disabledrepo { 'tcc-centos-testing': }

	file { '/etc/pki/rpm-gpg':
		ensure => 'directory', recurse => 'remote',
		group => 'root', owner => 'root',
		source => "${moduleloc}",
	}

}

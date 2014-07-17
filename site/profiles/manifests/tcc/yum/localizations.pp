class profiles::tcc::yum::localizations {
	case $operatingsystemreleaesmajor {
	'7': {
		$packlist = [
		'hunspell-am',
		'hunspell-ar',
		'hunspell-as',
		'hunspell-be',
		'hunspell-bn',
		'hunspell-br',
		'hunspell-csb',
		'hunspell-cv',
		'hunspell-eo',
		'hunspell-es',
		'hunspell-et',
		'hunspell-fur',
		'hunspell-grc',
		'hunspell-hi',
		'hunspell-hil',
		'hunspell-hsb',
		'hunspell-is',
		'hunspell-it',
		'hunspell-kk',
		'hunspell-km',
		'hunspell-mg',
		'hunspell-mt',
		'hunspell-nb',
		'hunspell-or',
		'hunspell-pl',
		'hunspell-pt',
		'hunspell-ro',
		'hunspell-ru',
		'hunspell-rw',
		'hunspell-sc',
		'hunspell-se',
		'hunspell-shs',
		'hunspell-si',
		'hunspell-sq',
		'hunspell-sr',
		'hunspell-st',
		'hunspell-sv',
		'hunspell-te',
		'hunspell-tet',
		'hunspell-th',
		'hunspell-uk',
		'hunspell-ur',
		'hunspell-uz',
		'hunspell-ve',
		'hunspell-vi',
		'hunspell-wa',
		'hunspell-af',
		'hunspell-ak',
		'hunspell-ast',
		'hunspell-az',
		'hunspell-ber',
		'hunspell-bg',
		'hunspell-ca',
		'hunspell-cop',
		'hunspell-cs',
		'hunspell-cy',
		'hunspell-da',
		'hunspell-de',
		'hunspell-dsb',
		'hunspell-el',
		'hunspell-en',
		'hunspell-en-GB',
		'hunspell-en-US',
		'hunspell-eu',
		'hunspell-fa',
		'hunspell-fj',
		'hunspell-fo',
		'hunspell-fr',
		'hunspell-fy',
		'hunspell-ga',
		'hunspell-gd',
		'hunspell-gl',
		'hunspell-gu',
		'hunspell-gv',
		'hunspell-haw',
		'hunspell-he',
		'hunspell-hr',
		'hunspell-ht',
		'hunspell-hu',
		'hunspell-hy',
		'hunspell-ia',
		'hunspell-id',
		'hunspell-kn',
		'hunspell-ko',
		'hunspell-ku',
		'hunspell-ky',
		'hunspell-la',
		'hunspell-lb',
		'hunspell-ln',
		'hunspell-lt',
		'hunspell-lv',
		'hunspell-mai',
		'hunspell-mi',
		'hunspell-mk',
		'hunspell-ml',
		'hunspell-mn',
		'hunspell-mos',
		'hunspell-mr',
		'hunspell-ms',
		'hunspell-nds',
		'hunspell-ne',
		'hunspell-nl',
		'hunspell-nn',
		'hunspell-nr',
		'hunspell-nso',
		'hunspell-ny',
		'hunspell-oc',
		'hunspell-om',
		'hunspell-pa',
		'hunspell-qu',
		'hunspell-quh',
		'hunspell-sk',
		'hunspell-sl',
		'hunspell-smj',
		'hunspell-so',
		'hunspell-ss',
		'hunspell-sw',
		'hunspell-ta',
		'hunspell-ti',
		'hunspell-tk',
		'hunspell-tl',
		'hunspell-tn',
		'hunspell-tpi',
		'hunspell-ts',
		'hunspell-xh',
		'hunspell-yi',
		'hunspell-zu',
		]
		$removelist = []
		}
	default: {
		$packlist = []
		$removelist = []
		}
	}
	Package { ensure => 'installed', require => Exec['yum-makecache'], }
	package { $packlist : provider => 'yum', }
	package { $removelist : provider => 'yum', ensure => 'absent', }
}

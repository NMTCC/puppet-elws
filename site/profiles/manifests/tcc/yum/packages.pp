# Defines the TCC package lists
class profiles::tcc::yum::packages {

  case $::operatingsystemrelease {
    '19': {
      $packlist = [
        'a2ps',
        'abiword',
        'accountsservice-debuginfo',
        'ack',
#       'AdobeReader_enu',
        'alpine',
        'alsamixergui',
        'apcupsd',
        'aria2',
        'atk-debuginfo',
        'audacious',
        'audacious-plugins',
        'audacious-plugins-freeworld',
        'audacious-plugins-freeworld-aac',
        'audacious-plugins-freeworld-mms',
        'audacious-plugins-freeworld-mp3',
        'audacity-freeworld',
        'audit-debuginfo',
        'awesome',
        'banner',
        'bison',
        'blackbox',
        'blender',
        'bluefish',
        'bpython',
        'byacc',
        'bzr',
        'cabal-install',
        'cairo-debuginfo',
        'calligra-krita',
        'cinnamon',
        'clang',
        'clang-devel',
        'claws-mail',
        'claws-mail-plugins',
        'clearlooks-compact-gnome-theme',
        'clisp',
        'clutter-debuginfo',
        'compat-gcc-34',
        'compat-gcc-34-g77',
        'ConsoleKit-x11',
        'cryptkeeper',
        'dbus-debuginfo',
        'dbus-glib-debuginfo',
        'dconf-editor',
        'dia',
        'dialog',
        'emacs',
        'emacs-docbook-rng',
        'erlang',
        'evolution-data-server-debuginfo',
        'expect',
        'ez-pine-gpg',
        'feh',
        'festival',
        'fftw',
        'fish',
        'flash-plugin',
        'flex',
        'fluxbox',
        'fontconfig-debuginfo',
        'fortune-mod',
        'fpc',
        'freeglut',
        'freeglut-devel',
        'freetype-debuginfo',
        'fuse-sshfs',
        'fvwm',
        'gcc-gnat',
        'GConf2-debuginfo',
        'gconf-editor',
        'gdk-pixbuf2-debuginfo',
        'gdm-debuginfo',
        'geeqie',
        'gftp',
        'ghc-ghc-devel',
        'ghex',
        'gimp',
        'gimp-resynthesizer',
        'git-all',
        'gjs-debuginfo',
        'glib2-debuginfo',
        'glibc-debuginfo',
        'glibc-devel',
        'GMT',
        'gnome-bluetooth-debuginfo',
        'gnome-desktop3-debuginfo',
        'gnome-menus-debuginfo',
        'gnome-shell-debuginfo',
        'gnome-theme-curvylooks',
        'gnome-tweak-tool',
        'gnugo',
        'gobject-introspection-debuginfo',
        'google-chrome-stable',
        'gpgme-devel',
        'grace',
        'graphviz',
        'grip',
        'gsl-devel',
        'gstreamer-debuginfo',
        'gtk+',
        'gtk3-debuginfo',
        'gtkterm',
        'gtk-xfce-engine',
        'haskell-platform',
        'htop',
        'icewm',
        'icewm-xdgmenu',
        'ImageMagick',
        'inkscape',
        'irssi',
        'iscan',
        'iscan-data',
        'iscan-plugin-gt-x750',
        'js-debuginfo',
        'json-glib-debuginfo',
        'k3b',
        'k3b-extras-freeworld',
        'kdiff3',
        'keychain',
        'lame',
        'lapack',
        'latex2html',
        'latex2rtf',
        'ldapvi',
        'lesstif',
        'libbsd-devel',
        'libcanberra-debuginfo',
        'libcroco-debuginfo',
        'libdrm-debuginfo',
        'libffi-debuginfo',
        'libgcc',
        'libglade',
        'libical-debuginfo',
        'libmatekbd',
        'libmatekeyring',
        'libmatenotify',
        'libmateweather',
        'libmatewnck',
        'libpng-debuginfo',
        'libreoffice',
        'libsoup-debuginfo',
        'libtorrent',
        'libtorrent-devel',
        'libX11-debuginfo',
        'libXau-debuginfo',
        'libXcomposite-debuginfo',
        'libXdamage-debuginfo',
        'libXdmcp-debuginfo',
        'libXext-debuginfo',
        'libXfixes-debuginfo',
        'libxml2-debuginfo',
        'libXp',
        'libXrandr-debuginfo',
        'linuxdoc-tools',
        'livecd-tools',
        'lm_sensors',
        'lohit-kannada-fonts',
        'lynx',
        'mate-backgrounds',
        'mate-calc',
        'mate-control-center',
        'mate-desktop',
        'mate-dialogs',
        'mate-file-archiver',
        'mate-file-manager',
        'mate-file-manager-open-terminal',
        'mate-icon-theme',
        'mate-image-viewer',
        'mate-keyring',
        'mate-keyring-pam',
        'mate-media',
        'mate-menus',
        'mate-netspeed',
        'mate-notification-daemon',
        'mate-panel',
        'mate-polkit',
        'mate-power-manager',
        'mate-session-manager',
        'mate-settings-daemon',
        'mate-system-log',
        'mate-system-monitor',
        'mate-terminal',
        'mate-text-editor',
        'mate-themes',
        'mate-utils',
        'mate-window-manager',
        'mc',
        'meld',
        'mencoder',
        'mercurial',
        'mesa-debuginfo',
        'mjpegtools',
        'mousepad',
        'mutt',
        'mutter-debuginfo',
        'MySQL-python',
        'nasm',
        'nautilus-open-terminal',
        'ncl',
        'ncl-devel',
        'netbeans-platform',
        'nethack',
        'net-snmp',
        'nmap',
        'nspr-debuginfo',
        'nss-debuginfo',
        'nss-util-debuginfo',
        'ntp',
        'numpy',
        'ocsinventory-agent',
        'octave',
        'octave-signal',
        'oracle-instantclient12.1-basic',
        'oracle-instantclient12.1-devel',
        'oracle-instantclient12.1-precomp',
        'oracle-instantclient12.1-sqlplus',
        'p7zip',
        'p7zip-plugins',
        'pam-debuginfo',
        'pango-debuginfo',
        'paraview',
        'parole',
        'pbzip2',
        'pdfchain',
        'pdfshuffler',
        'perl-Any-Moose',
        'perl-Authen-SASL',
        'perl-GSSAPI',
        'perl-LDAP',
        'perl-Text-Markdown',
        'python-pexpect',
        'pidgin',
        'polkit-debuginfo',
        'postgresql',
        'pulseaudio-debuginfo',
        'pv',
        'python3',
        'python3-devel',
        'python3-lxml',
        'python3-tkinter',
        'python3-tools',
        'python-4Suite-XML',
        'python-BeautifulSoup',
        'python-beautifulsoup4',
        'python-EnthoughtBase',
        'python-gdata',
        'python-ipython',
        'python-lxml',
        'python-markdown2',
        'python-matplotlib',
        'python-matplotlib-tk',
        'python-matplotlib-wx',
        'python-mechanize',
        'python-pep8',
        'python-pillow-tk',
        'python-pmw',
        'python-psycopg2',
        'python-setproctitle',
        'python-sqlalchemy',
        'python-virtualenv',
        'R',
        'rb_libtorrent',
        'rb_libtorrent-python',
        'redhat-lsb',
#       'remctl',
        'remctl-perl',
        'remctl-python',
        'rssh',
        'rubygem-gtk2',
        'ruby-gnome2',
        'ruby-irb',
        'ruby-ldap',
        'rxvt-unicode',
        'sane-backends-libs',
        'scipy',
        'screen',
        'scribus',
        'seamonkey',
        'SFML-devel',
        'sharutils',
        'sl',
        'slrn',
        'sox',
        'spamassassin',
        'spice-xpi',
        'sqlite-debuginfo',
        'sssd-client.i686',
        'sssd-client.x86_64',
        'sssd-debuginfo',
        'ssss',
        'strace',
        'startup-notification-debuginfo',
        'syslinux',
        'system-switch-displaymanager',
        'tango-icon-theme',
        'tcc-perl-Quota',
        'tccmotd',
        'tcpdump',
        'tcsh',
        'texlive-epstopdf',
        'telepathy-glib-debuginfo',
        'telepathy-logger-debuginfo',
        'thunar-volman',
        'thunderbird-enigmail',
        'thunderbird-lightning',
        'tigervnc',
        'tigervnc-server',
        'tinyfugue',
        'tmux',
        'trang',
        'transmission-daemon',
        'udftools',
        'udpcast',
        'unrar',
        'upower-debuginfo',
        'vacation',
        'vim-X11',
        'vlc',
        'w3m',
        'w3m-img',
        'WindowMaker',
        'wine',
        'wireshark',
        'wireshark-gnome',
        'wqy-zenhei-fonts',
        'wxPython',
        'xaos',
        'xchat',
        'xfce4-screenshooter-plugin',
        'xfce4-weather-plugin',
        'xfig',
        'xfwm4-themes',
        'xorg-x11-apps',
        'xorg-x11-xinit-session',
        'xpdf',
        'xscreensaver',
        'xscreensaver-extras',
        'xscreensaver-gl-extras',
        'xv',
        'yasm',
        'yum-utils',
        'zsh',
      ]
      $removelist = [
        'LPRng',
        'deja-dup',
      ]
    }
    default: {
      $packlist = []
      $removelist = []
    }
  }
  Package { ensure => 'installed', require => Exec['yum-makecache'], }
  package { $packlist : provider => 'yum', }
  package { $removelist : ensure => 'absent', provider => 'yum', }
}
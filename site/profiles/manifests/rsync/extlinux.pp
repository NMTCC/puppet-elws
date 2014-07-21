class profiles::rsync::extlinux {
  rsync::get { 'extlinux': 
    source => "update.nmt.edu::C7-extlinux",
    path => '/' }
}
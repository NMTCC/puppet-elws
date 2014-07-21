class profiles::rsync::extlinux {
  rsync::get { 'extlinux': 
    source => "update.nmt.edu::extlinux",
    path => '/' }
}
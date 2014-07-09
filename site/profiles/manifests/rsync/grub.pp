class profiles::rsync::grub {
  rsync::get { 'grub': 
    source => "update.nmt.edu::grub"
    path => '/' }
}
class profiles::rsync::maple {
  rsync::get { 'maple': 
    source => "update.nmt.edu::C7-maple",
    path => '/' }
}
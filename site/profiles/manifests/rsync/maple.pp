class profiles::rsync::maple {
  rsync::get { 'maple': 
    source => "update.nmt.edu::maple"
    path => '/' }
}
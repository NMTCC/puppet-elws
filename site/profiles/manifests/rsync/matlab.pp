class profiles::rsync::matlab {
  rsync::get { 'matlab': 
    source => "update.nmt.edu::matlab",
    path => '/' }
}
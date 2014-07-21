class profiles::rsync::matlab {
  rsync::get { 'matlab': 
    source => "update.nmt.edu::C7-matlab",
    path => '/' }
}
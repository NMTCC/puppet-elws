class profiles::rsync::vmd {
  rsync::get { 'vmd': 
    source => "update.nmt.edu::C7-vmd",
    path => '/' }
}
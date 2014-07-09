class profiles::rsync::vmd {
  rsync::get { 'vmd': 
    source => "update.nmt.edu::vmd"
    path => '/' }
}
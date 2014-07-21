class profiles::rsync::comsol {
  rsync::get { 'comsol': 
    source => "update.nmt.edu::C7-comsol",
    path => '/' }
}
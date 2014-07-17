class profiles::rsync::comsol {
  rsync::get { 'comsol': 
    source => "update.nmt.edu::comsol",
    path => '/' }
}
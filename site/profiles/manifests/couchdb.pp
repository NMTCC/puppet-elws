# class profiles::couchdb

class profiles::couchdb {

  class { '::couchdb': }
  
  package { 'hiera-http-gpg':
    ensure   => 'installed',
    provider => 'gem',
  }
        


}

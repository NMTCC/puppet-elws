node C7 {

  include roles::tcc
  include roles::sensu

}

node default inherits C7 { }

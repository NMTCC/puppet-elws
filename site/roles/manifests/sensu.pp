# class roles::sensu

class roles::sensu {
  include profiles::sensu
  include profiles::sensu::plugins
  
  Class[profiles::sensu] -> Class[profiles::sensu::plugins]
}
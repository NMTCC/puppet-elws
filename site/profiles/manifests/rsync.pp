# class profiles::tcc::rsync

class profiles::tcc::rsync::all {
  include profiles::tcc::rsync::comsol
  include profiles::tcc::rsync::extlinux
  include profiles::tcc::rsync::grub
  include profiles::tcc::rsync::maple
  include profiles::tcc::rsync::matlab
  include profiles::tcc::rsync::vmd
}
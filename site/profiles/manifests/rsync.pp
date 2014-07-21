# class profiles::rsync::all

class profiles::rsync::all {
  include profiles::rsync::comsol
  include profiles::rsync::extlinux
  include profiles::rsync::maple
  include profiles::rsync::matlab
  include profiles::rsync::vmd
}
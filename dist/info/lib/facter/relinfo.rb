Facter.add(:operatingsystemreleaesmajor) do
  confine :operatingsystem => "CentOS"
  setcode do
    Facter.value(:operatingsystemreleaesmajor).gsub(/\.(.*)/,'')
  end
end
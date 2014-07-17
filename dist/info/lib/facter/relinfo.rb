Facter.add(:operatingsystemreleasemajor) do
  confine :operatingsystem => "CentOS"
  setcode do
    Facter.value(:operatingsystemrelease).gsub(/\.(.*)/,'')
  end
end
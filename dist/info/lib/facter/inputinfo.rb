Facter.add("mousecount") do
  confine :operatingsystem => "CentOS"

  setcode do
    `lsusb | grep -i mouse | wc -l`.to_i
  end
end

Facter.add("keyboardcount") do
  confine :operatingsystem => "CentOS"

  setcode do
    `lsusb | grep -i keyboard | wc -l`.to_i
  end
end

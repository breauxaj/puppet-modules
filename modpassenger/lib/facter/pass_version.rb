require 'facter'
Facter.add("pass_version") do
  confine :kernel => %w{Linux}
  setcode do
    Facter::Util::Resolution.exec("rpm -qa | grep mod_passenger | awk -F\"-\" '{ print $2 }'")
  end
end

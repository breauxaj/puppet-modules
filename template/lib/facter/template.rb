require 'facter'
Facter.add("template") do
  confine :osfamily => %w{RedHat}
  setcode do
    output = 'template'
    output
  end
end

require 'facter'
Facter.add(:role) do
  setcode do
    therole = 'undefined'
    if File.exists?('/etc/role')
      File.open('/etc/role', "r") do |f|
        f.each_line do |line|
          therole = line.chomp.downcase
        end
      end
    end
    therole
  end
end

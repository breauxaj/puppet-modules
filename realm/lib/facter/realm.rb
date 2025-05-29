require 'facter'
Facter.add(:realm) do
  setcode do
    therealm = 'undefined'
    if File.exists?('/etc/realm')
      File.open('/etc/realm', "r") do |f|
        f.each_line do |line|
          therealm = line.chomp.downcase
        end
      end
    end
    therealm
  end
end

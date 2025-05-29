require 'facter'
Facter.add(:sdlc) do
  setcode do
    thesdlc = 'undefined'
    if File.exists?('/etc/sdlc')
      File.open('/etc/sdlc', "r") do |f|
        f.each_line do |line|
          thesdlc = line.chomp.downcase
        end
      end
    end
    thesdlc
  end
end

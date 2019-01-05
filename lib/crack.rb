require_relative 'enigma'

message = File.read(ARGV[0]).chomp
destination = File.open(ARGV[1], 'w')

enigma = Enigma.new

cracked_message = enigma.crack(message, ARGV[2])
destination.write(cracked_message[:decryption])
output = "Created '#{ARGV[1]}' with the cracked key #{cracked_message[:key]} "
output += "and date #{ARGV[2]}."
puts output

require_relative 'enigma'

message = File.read(ARGV.first)
destination = File.open(ARGV.last, "w")

enigma = Enigma.new

encrypted_message = enigma.encrypt(message)
destination.write(encrypted_message[:encryption])
puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]}" +
     " and date #{encrypted_message[:date]}."

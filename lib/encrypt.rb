require_relative 'enigma'

message = File.read(ARGV.first)
destination_file = File.open(ARGV.last, "w")
enigma = Enigma.new
encrypted_message = enigma.encrypt(message)
destination_file.write(encrypted_message[:encryption])
puts "Created '#{ARGV.last}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}."


# require 'pry'; binding.pry

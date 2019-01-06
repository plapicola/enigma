require_relative 'enigma'

encoded_message = File.read(ARGV.first)
destination_file = File.open(ARGV[1], "w")
enigma = Enigma.new

decrypted_message = enigma.decrypt(encoded_message, ARGV[2], ARGV[3])

destination_file.write(decrypted_message[:decryption])

puts "Created #{ARGV[1]} with the key #{decrypted_message[:key]}" +
     " and date #{decrypted_message[:date]}."

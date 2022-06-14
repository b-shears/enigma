require_relative 'enigma'
require_relative 'key_generator'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

message = handle.read

writer = File.open(ARGV[1], "w")

result = enigma.decrypt(message, ARGV[2], ARGV[3])

writer.write(result[:decryption])

p "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{result[:date]}"

writer.close

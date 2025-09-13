require 'ohai'

ohai = Ohai::System.new
ohai.all_plugins

puts "=" * 30 # Creates a string with "=" repeated 40 times
puts "Ohai Test Result!"
puts "=" * 30 # Creates a string with "=" repeated 40 times

puts "=== CPU Info ==="
puts "CPU Count: #{ohai[:cpu][:total]}"
puts "CPU Model: #{ohai[:cpu]['0'][:model_name] rescue 'N/A'}"

puts "\n=== Network ==="
puts "IP Address: #{ohai[:ipaddress]}"
puts "MAC Address: #{ohai[:macaddress]}"

puts "\n=== Network Info ==="
puts "Hostname: #{ohai[:hostname]}"
puts "IP Address: #{ohai[:ipaddress]}"
puts "MAC Address: #{ohai[:macaddress]}"

puts "=" * 30 # Creates a string with "=" repeated 40 times
puts "Ohai test completed!"
puts "=" * 30 # Creates a string with "=" repeated 40 times
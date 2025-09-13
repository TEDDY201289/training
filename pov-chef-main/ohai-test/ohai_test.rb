#!/opt/chef-workstation/embedded/bin/ruby

require 'ohai'

puts "Starting Ohai system scan..."
puts "=" * 40 # Creates a string with "=" repeated 40 times

# Initialize Ohai
ohai = Ohai::System.new
ohai.all_plugins

# Display system information
puts "Platform: #{ohai[:platform]}"
puts "Platform Version: #{ohai[:platform_version]}"
puts "Total Memory: #{ohai[:memory][:total]}"
puts "Hostname: #{ohai[:hostname]}"
puts "Architecture: #{ohai[:kernel][:machine]}"

puts "=" * 40 # Creates a string with "=" repeated 40 times
puts "Ohai test completed!"
# Function to print a staircase pattern with 'n' steps
def print_staircase(n)
  (1..n).each do |i|
    # Calculate the number of spaces needed before the hashes
    spaces = ' ' * (n - i)
    
    # Calculate the number of hashes ('#') for the current level
    hashes = '#' * i
    
    # Print the concatenated result of spaces and hashes
    puts spaces + hashes
  end
end

puts "Enter the height of the staircase:"

# Get the user's input, convert it to an integer, and store it in 'n'
n = gets.chomp.to_i

print_staircase(n)

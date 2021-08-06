# https://www.codewars.com/kata/55983863da40caa2c900004e/ruby

# The challenge was to create a function that takes a positive integer and returns
# the next bigger number that can be formed by rearranging its digits. For example:
# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# 2871 ==> 7128

# The first solution we came up with was using Ruby's `permutation` method which takes an array of integers and forms
# all possible permutations (those are the different combinations of digits that are possible).
# We then went over these combinations and searched for the next greater one
# (after some transformation from array to integers and some sorting).
# However, this solution was not accepted because it would time out. Just imagine how many combinations have to be created when
# it's a ten digit integer like 9876543210.

# A working solution approaches this problem from the back (right to left) -
# which makes sense because we really just need to find one number, the next biggest one.
# Especially, in integers with multiple digits, we might just need to swap the last and second to last digit,no need to
# touch the thousands and hundreds position at all.

# ```
#  5613 => 5631
# ```

# We can approach that by imagining two pointers: one starting at the second to last digit and moving to the left.
# And a second one iterating through whatever is on the right of the first pointer.
# In order to do this programmatically we use a nested loop
# starting with the second to last (first pointer/outer loop).
# and last digit (second pointer/inner loop).
#  It checks if the second to last digit is less than the last one - because if that's the case
# swapping them would make our whole integer bigger. And if that is actually the case, we do swap those two digits and break out of the loop.
# Before we can return our new integer we need to do some shuffling though:

# Let's imagine we didn't just swap the last two digits but we continue this behaviour moving through each digit of our integer from the back
# and finally reach the condition to swap with the first and the second to last number. Like it would be the case with 2871.
# ```
#   2871 or [2, 8, 7, 1]
#                 p1 | p2
# ```
# In the first iteration we compare 7 to 1: 7 is not less than 1.
# Second iteration: we compare 8 to 1: 8 is not less than 1.
# Neither is 7 in the third iteration where we compare 8 and 7.
# Only after having the first pointer pointing at the first digit (2) and checking it against all other digits starting from the back
# we finally get: 2 is smaller than 7. So we can swap those two.

# Now we have: 7821 - which is not the next biggest possible number after (7128). So far we just found out that 7 has to be in the thousands position.
# We still have to sort the remaining digits, which we can do by keeping the first `i + 1` (i is the outer loop pointer).
# And the rest we sort in a descending order before joining them all back together and returning.
# If there is no possbile next bigger number and the loops end without any returned new integer, we return -1 as per the specs.


# times out :(
def rachel_next_bigger(n)
  permutations = n.to_s.split(//).permutation.to_a
  raw_numbers = permutations.map { |item| item.join.to_i }
  sorted_numbers = raw_numbers.uniq.sort
  index = sorted_numbers.index(n) + 1
  sorted_numbers[index]
  return sorted_numbers[index] == nil ? -1 : sorted_numbers[index]
end

def next_bigger(n)
  chars = n.to_s.chars
  (0..chars.length-2).reverse_each do |i|
    # puts "i is #{i} chars[i] is #{chars[i]}"

    (i+1..chars.length-1).reverse_each do |j|
      # puts "j is #{j}  chars[j] is #{chars[j]}"
      if chars[i] < chars[j]
        # puts "If statement #{chars[i]} and #{chars[j]}"
        chars[i], chars[j] = chars[j], chars[i]
        # puts "Chars: #{chars}"
        return (chars.first(i + 1) + chars.last(chars.length - 1 - i).sort).join.to_i
      #              [5, 3 ] + [1]   => 531
      end
    end
    puts "_____________"
  end
  -1
end

p next_bigger(2871)
# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# 2871 ==> 7128

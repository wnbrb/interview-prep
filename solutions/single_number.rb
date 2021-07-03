# Brute force with #count
# O(n^2) time and O(1) space
def single_number(num)
  num.each do |n|
    return n if num.count(n) == 1
  end
end

# Tally
# O(n) time and O(n) space
def single_number(nums)
  nums.each_with_object(Hash.new(0)) { |n, h| h[n] += 1 }
end


# XOR operator or bitwise operator
# O(n) time and O(1) space
def single_number(nums)
  result = 0 

  nums.each do |singular_num|
    result = result ^ singular_num
  end

  result
end

=begin
*** bitwise operator walk through ***
nums = [2, 2, 1]
result ^ singular_num
0 ^ 2 = 00 ^ 10 = 10 = 2 < -- result 
2 ^ 2 = 10 ^ 10 = 00 = 0 < -- result
0 ^ 1 = 00 ^ 01 = 01 = 1 < -- result

0 ^ 0 = 0
0 ^ 1 = 1
1 ^ 1 = 0
1 ^ 0 = 1 

if array is [4, 1, 2, 1, 2]
4 ^ 1 ^ 2 ^ 1 ^ 2 = 1 ^ 4 ^ 1 ^ 2 ^ 2
=end

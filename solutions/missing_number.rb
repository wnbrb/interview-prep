# https://leetcode.com/problems/missing-number/

# 1. Ruby Magic (Brute force)
# create array with all numbers and subtract given array from it
def missing_number1(nums)
  range = (0..nums.length).to_a
  difference = range - nums
  difference.first
  # as a one liner:
  # ((0..nums.length).to_a - nums).first
end

# 2. Brute force
# Sum of array with all numbers minus sum of array of given numbers
def missing_number(nums)
  (0..nums.size).sum - nums.sum
end

# 3. Create ideal array while looping over the given array
# by utilizing the index
def missing_number(nums)
  expected = 0
  actual = 0
  nums.each_with_index do |num, index|
    actual += num
    expected += (index + 1)
  end
  expected - actual
end

# 4. Hash
def missing_number(nums)
  tally = nums.reduce(Hash.new) do |tally, num|
    tally[num] = 1
    tally
  end

  num = 0
  while tally[num] do
    num += 1
  end
  num
end

# 5. Sort array first
def missing_number(nums)
    cur = 0
    nums.sort!.each do |num|
        unless cur == num
            break
        end
        cur += 1
    end

    return cur
end





test1 = missing_number([3,0,1])
puts "1. result: #{test1} -> passing: #{test1 === 2}"

test2 = missing_number([0,1])
puts "2. result: #{test2} -> passing: #{test2 === 2}"
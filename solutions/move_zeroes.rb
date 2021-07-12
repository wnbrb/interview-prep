# https://leetcode.com/problems/move-zeroes/

# brute force solution
def move_zeroes(nums)
  nums.length.times do |index|
    if nums[index] == 0
      nums[index] = nil
      nums << 0
    end
  end
  nums.compact!
end

# using two pointers - one to keep track of the zeroes and move them to the end
def move_zeroes(nums)
  zero_index = -1;

  nums.length.times do |i|
    if nums[i] == 0 && !(zero_index >= 0)
      zero_index = i;
    end

    if nums[i] != 0 && zero_index >= 0
        temp = nums[i]
        nums[i] = nums[zero_index]
        nums[zero_index] = temp

        zero_index = zero_index + 1
    end
  end
end

# using two pointers - one to keep track of the non-zero elements moving them to the front
def move_zeroes(nums)
  last_non_zero_index = 0;
  nums.each_with_index do |num, index|
      if !num.zero?
          # swap
          nums[last_non_zero_index], nums[index] = nums[index], nums
          last_non_zero_index += 1
      end
  end
end

# https://leetcode.com/problems/sort-colors/

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums) # insertion sort
  which = 1
  while which < nums.length
    val = nums[which]
    i = which - 1
    while i >= 0
      if nums[i] > val
        nums[i + 1] = nums[i]
        nums[i] = val
      else
        break
      end
      i -= 1
    end
    which += 1
  end
end


def sort_colors(nums) # shift
  i = 0
  nums.size.times do
    if nums[i] == 0
      nums.delete_at(i)
      nums.unshift(0)
      i = i + 1
    elsif nums[i] == 2
      nums.delete_at(i)
      nums << 2
    else
      i += 1
    end
  end
end

def sort_colors(nums) # one pass
  pointer0 = 0
  pointer2 = nums.length - 1
  cur = 0

  while cur <= pointer2
    if nums[cur] == 2
      nums[cur], nums[pointer2] = nums[pointer2], nums[cur]
      pointer2 -= 1
      # swap with int at p2 and p2 -1
    elsif nums[cur] == 0
      nums[cur], nums[pointer0] = nums[pointer0], nums[cur]
      pointer0 += 1
      cur += 1
      #swap with int at p0 and p0 +1
    else
      cur += 1
    end
  end
end

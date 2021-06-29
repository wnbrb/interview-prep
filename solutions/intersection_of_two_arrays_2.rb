# Brute force solution 1
def intersect(nums1, nums2)
  intersection = nums1.map do |num1|
    if nums2.include?(num1)
        index = nums2.find_index(num1)
        nums2.delete_at(index)
    end
  end
  intersection.compact
end


# Brute force solution 2
def intersect(nums1, nums2)
  nums2.inject([]) do |memo, num|
    puts "memo is #{memo}"
    puts "num is #{num}"
    p nums1
    if nums1.include?(num)
      nums1[nums1.find_index(num)] = nil
      memo << num
    else
      memo
    end
  end
end


# Two pointers solution (must sort the arrays)
def intersect(nums1, nums2)
  pointer_intersect(nums1.sort!, nums2.sort!)
end

def pointer_intersect(nums1, nums2)
  nums1_pointer = 0
  nums2_pointer = 0

  matches = []
  while nums1_pointer < nums1.length && nums2_pointer < nums2.length 
    if nums1[nums1_pointer] == nums2[nums2_pointer]
      matches << nums1[nums1_pointer]
      nums1_pointer += 1
      nums2_pointer += 1
    elsif nums1[nums1_pointer] < nums2[nums2_pointer]
      nums1_pointer += 1
    else
      nums2_pointer += 1
    end
  end
  matches
end


# Hash map solution
def intersect(nums1, nums2)
  hash =  {}
  intersection = []
  nums1.each do |num|
    if hash[num]
        hash[num] += 1
    else
        hash[num] = 1
    end
  end

  nums2.each do |num|
    if !hash[num].nil? && hash[num].positive?
        intersection << num
        hash[num] -= 1
    end
  end
  intersection
end
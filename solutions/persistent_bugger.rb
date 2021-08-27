# https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby

def persistence2(n, times = 0)
  return times if n>=0 && n<10

  times+=1
  nums = []
  while n>0
    n, remainder = n.divmod(10)
    nums << remainder
  end
  persistence(nums.reduce(:*), times)
end


def persistence3(number, count = 0)
  return count if number < 10

  count += 1
  array = number.to_s.split(//).map(&:to_i)
  number = array.reduce(:*)
  persistence(number, count)
end

def persistence(n)
  n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
end

puts persistence(4) == 0
puts persistence(25) == 2
puts persistence(31) == 0
puts persistence(39) == 3
puts persistence(444) == 3
puts persistence(999) == 4


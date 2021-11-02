# https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby

 # recursion

def persistence(n, counter = 0)
  array = n.to_s.chars.map(&:to_i) # lambda or proc

  return counter if n < 10
  num = array.inject(:*)

  persistence(num, counter + 1)
end

def persistence(n, count = 0)
    return count if n < 10

    persistence(n.to_s.split('').map(&:to_i).reduce(:*), count + 1)
end

def persistence(n, count = 0)
    return count if n < 10

    total = 1

    while n > 0 do
      total *= n % 10
      n = n / 10
    end

    persistence(total, count + 1)
end

# Tests
puts persistence(4) == 0
puts persistence(25) == 2
puts persistence(31) == 1
puts persistence(39) == 3
puts persistence(444) == 3
puts persistence(999) == 4

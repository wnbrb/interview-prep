# https://www.codewars.com/kata/55983863da40caa2c900004e/ruby

# 1. Use Ruby's `permutation` method - times out :(
def next_bigger(n)
  permutations = n.to_s.split(//).permutation.to_a
  raw_numbers = permutations.map { |item| item.join.to_i }
  sorted_numbers = raw_numbers.uniq.sort
  index = sorted_numbers.index(n) + 1
  sorted_numbers[index]
  return sorted_numbers[index] == nil ? -1 : sorted_numbers[index]
end

# 2. Approach from right to left with two pointers
def next_bigger(n)
  chars = n.to_s.chars
  (0..chars.length-2).reverse_each do |i|
    (i+1..chars.length-1).reverse_each do |j|
      if chars[i] < chars[j]
        chars[i], chars[j] = chars[j], chars[i]
        return (chars.first(i + 1) + chars.last(chars.length - 1 - i).sort).join.to_i
      end
    end
  end
  -1
end



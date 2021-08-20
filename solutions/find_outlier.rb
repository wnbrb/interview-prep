# https://www.codewars.com/kata/5526fc09a1bbd946250002dc

[Check out the instructions on Codewars](

def find_outlier(integers)
  (0..Float::INFINITY).each do |i|

    num1 = integers[i].even?
    num2 = integers[i+1].even?
    num3 = integers[i+2].even?

    # next if (num1 && num2 && num3)
    next if (num1 == num2 && num2 == num3)

    if num1 == num2
      return integers[i+2]
    elsif num1 == num3
      return integers[i+1]
    else
      return integers[i]
    end
  end
end

def find_outlier(integers)
  even_count = integers.count { |num| num.even? }
  if even_count == 1
    integers.select { |num| num.even? }[0]
  else
    integers.select { |num| num.odd? }[0]
  end
end

def find_outlier(integers)
  partitioned = integers.partition { |v| v.even? }
  partitioned.find { |arrays| arrays.length == 1}.first
end

def find_outlier(integers)
    even_integers = integers.select(&:even?)
    odd_integers = integers.select(&:odd?)

    if even_integers.length == 1
        even_integers[0]
    else
        odd_integers[0]
    end
end

def find_outlier(integers)
  pointer_even = -1
  pointer_odd = -1
  counter_even = 0
  counter_odd = 0
  index = 0

  until (counter_even == 1 && counter_odd >= 2) || (counter_even >= 2 && counter_odd == 1)  do
    num = integers[index]
    counter_even += 1 if num.even?
    counter_odd += 1 if num.odd?
    pointer_even = index if num.even?
    pointer_odd = index if num.odd?
    index += 1
  end
  return integers[pointer_even] if counter_odd >= 2
  return integers[pointer_odd] if counter_even >= 2
end

def find_outlier(integers)
  block = integers.one?(&:even?) ? :even? : :odd?
  integers.find(&block)
end

# (0..Float::INFINITY).lazy.map(&:even).first(10)
# constant
# NAME = "Clara".freeze

p "1. Test: [0, 1, 2] => 1: #{find_outlier([0, 1, 2]) == 1}"
p "2. Test: [1, 2, 3] => 2: #{find_outlier([1, 2, 3]) == 2}"
p "3. Test: [2, 4, 0, 100, 4, 11, 2602, 36] => 11: #{find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11}"
p "4. Test: [160, 3, 1719, 19, 11, 13, -21] => 160: #{find_outlier([160, 3, 1719, 19, 160, 13, -21]) == 160}"

# Find outlier

[Check out the instructions on Codewars](https://www.codewars.com/kata/5526fc09a1bbd946250002dc)

> You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

### Solution 1 - Check three at the time

This solution is making use of Float's Infinity constant. It check's three integers at the same time because that is the number you need to look at in order to find out if the outlier is either even or odd.

```Ruby
def find_outlier(integers)
  (0..Float::INFINITY).each do |i|

    num1 = integers[i].even?
    num2 = integers[i+1].even?
    num3 = integers[i+2].even?

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
```

### Solution 2 - `count` and `select`

```Ruby
def find_outlier(integers)
  even_count = integers.count { |num| num.even? }
  if even_count == 1
    integers.select { |num| num.even? }[0]
  else
    integers.select { |num| num.odd? }[0]
  end
end
```

### Solution 3 - `select` with Procs

```Ruby
def find_outlier(integers)
    even_integers = integers.select(&:even?)
    odd_integers = integers.select(&:odd?)

    if even_integers.length == 1
        even_integers[0]
    else
        odd_integers[0]
    end
end
```

### Solution 4 - Ruby's `partition`

```Ruby
def find_outlier(integers)
  partitioned = integers.partition { |v| v.even? }
  partitioned.find { |arrays| arrays.length == 1}.first
end
```

### Solution 5 - Ruby Magic

```Ruby
def find_outlier(integers)
  block = integers.one?(&:even?) ? :even? : :odd?
  integers.find(&block)
end
```

### Solution 6 - Pointers

```Ruby
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
```

#### Test cases

```Ruby
p "1. Test: [0, 1, 2] => 1: #{find_outlier([0, 1, 2]) == 1}"
p "2. Test: [1, 2, 3] => 2: #{find_outlier([1, 2, 3]) == 2}"
p "3. Test: [2, 4, 0, 100, 4, 11, 2602, 36] => 11: #{find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11}"
p "4. Test: [160, 3, 1719, 19, 11, 13, -21] => 160: #{find_outlier([160, 3, 1719, 19, 160, 13, -21]) == 160}"
```

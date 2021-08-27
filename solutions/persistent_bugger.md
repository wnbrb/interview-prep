# Scramblies

[Check out the instructions on Codewars](https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby)

> Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

#### Some Preliminary Considerations

##### 1. How to determine the length of an integer (number of digits)?

See this [stack overflow answer](https://stackoverflow.com/a/48866874/9595653) for benchmarks.

```Ruby
integer.to_s.length
```

```Ruby
integer.digits
```

```Ruby
Math.log10(integer).to_i + 1
```

##### 2. Modulo operator in Ruby

Working with the modulo operator is pretty straight forward until we start working with negative numbers:
So in Ruby

```Ruby
123 % 10 # => 3
```

but

```Ruby
-123 % 10 # => 7
```

Why? 🤯
Well, Ruby assumes that there are two rules for the remainder that need to be fulfilled:

1. The remainder has to be positive.
2. The remainder has to be less than the divisor (that's the 3 - the number by which another number is to be divided)

[Ruta](https://twitter.com/rreisoh) explained it like this - starting off with the example of 5 divided 3.
If we work with full numbers, 5 divided by 3 is 1 with a remainder of 2:

```Ruby
 5 : 3 = 1 r.2
```

But why? Why don't we solve 5 divided by 3 with 2 and a remainder of -1?

```Ruby
5 : 3 = 2 r.-1
# Because 3 * 2 = 6 and 6 - 1 = 5
```

This is because of the above-mentioned rules. The remainder has to be positive!
So if we start to introduce negative numbers into our examples, we cannot solve it like this - even though it might seem intuitive:

```Ruby
-5 : 3 = -1 r.-2
```

But we have to find a solution that fulfills both rules. Like so:

```Ruby
-5 :3 = -2 r.1
# Because 3 * -2 = -6.
# And - 6 + 1 = -5.
```

By the way: other programming languages might handle this differently, see also [this answer](https://stackoverflow.com/a/16074198/9595653).

### Solution 1 - Recursion with `.divmod`

```Ruby
def persistence(n, times = 0)
  return times if n >= 0 && n < 10

  times+=1
  nums = []
  while n > 0
  n, remainder = n.divmod(10)
  nums << remainder
  end
  persistence(nums.reduce(:*), times)
end

```

### Solution 2 - Recursion via String

```Ruby
def persistence(number, count = 0)
  return count if number < 10

  count += 1
  array = number.to_s.split(//).map(&:to_i)
  number = array.reduce(:*)
  persistence(number, count)
end
```

### Solution 3 - One-liner

Not super readable, but it fit's in one line

```Ruby
def persistence(n)
n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
end
```

#### Test cases

```Ruby
puts persistence(4) == 0
puts persistence(25) == 2
puts persistence(31) == 0
puts persistence(39) == 3
puts persistence(444) == 3
puts persistence(999) == 4
```

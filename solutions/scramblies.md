# Scramblies

[Check out the instructions on Codewars](https://www.codewars.com/kata/55c04b4cc56a697bb0000048)

> Complete the function scramble(str1, str2) that returns true if a portion of str1 characters
> can be rearranged to match str2, otherwise returns false.

### Solution 1 - Hash

In first solution we could have used with Ruby's inbuilt [`tally`](https://rubyapi.org/3.0/o/s?q=tally). But we also provided our own tally method because most online IDEs don't run with Ruby 2.7. yet which introduced `tally` to the Enumerable module.

```Ruby
def scramble(s1, s2)
  mixed = tally(s1)
  word = tally(s2)
  word.all? { |key, value| value <= mixed[key] }
end

# for older Ruby versions, that don't support the native tally
def tally(str)
  str.split(//).reduce(Hash.new(0)) do |tally, char|
    tally[char] += 1
    tally
  end
end
```

If you have a hard time understanding `reduce` here is our own tally version with `.each` instead. When using `each` as the iterative method we have to
create the Hash that saves the occurrences ourselves.

```Ruby
def tally(str)
  tally = Hash.new(0)
  str.split(//).each do |char|
    tally[char] += 1
  end
  tally
end
```

### Solution 2 - String methods

A nice collection of string methods is used in this solution. `Each_char` makes it easy to iterate over a string without splitting it into an array first.And `sub!` is used to delete characters from the bigger string.

```Ruby
def scramble(s1, s2)
  s2.each_char do |char|
    return false unless s1.include? char

    s1.sub!(char, '')
  end
  true
end
```

### Solution 3 - Create your own Array#frequency

Here we're adding out own `frequency` method to the Array Class.

```Ruby
class Array
  def frequency
    Hash.new(0).tap { |counts| each { |v| counts[v] +=1} }
   end
 end

def scramble(s1,s2)

  split1 = s1.chars.frequency
  split2 = s2.chars.frequency

  split2.all? { |char2, count2| split1[char2] >= count2 }
end
```

### Solution 4 - Two pointers

When both strings are sorted you can move over them with two pointers combining each single character as you go. If the characters are the same, or if the longer string has more characters that are earlier in the alphabet.
A little example:

```Ruby
string1 = "katas"
string2 = "steak"

sorted1 = "aakst"
sorted2 = "aekst
```

👆 Looking at the first two characters - `a` and `a` they're both the same, so we can both advance both pointers.
So in the second loop we look at the second characters respectively - `a` and `e`. Since `a` comes before `e` in the alphabet we can assume that
the string1 could have an `e` later on, so no need to cancel the whole mission just yet, we will only advance the pointer of the first word.

```Ruby
def scramble(s1,s2)
  a1 = s1.split("").sort
  a2 = s2.split("").sort
  pointer1 = 0
  pointer2 = 0

  while pointer2 < a2.length
    return false if pointer1 >= a1.length

    if a1[pointer1] == a2[pointer2]
      pointer1 += 1
      pointer2 += 1
    elsif a1[pointer1] < a2[pointer2]
      pointer1 += 1
    else
      return false
    end
  end
    true
end
```

### Solution 5 - all iterator

```Ruby
def scramble(s1, s2)
s2.chars.all? { |c| s1.sub!(c, '') }
end
```

p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters
# can be rearranged to match str2, otherwise returns false.

# Solution 1
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

# this is the same tally method as before but with each instead of reduce
def tally(str)
  tally = Hash.new(0)
  str.split(//).each do |char|
    tally[char] += 1
  end
  tally
end

# Solution 2
def scramble(s1, s2)
  s2.each_char do |char|
    return false unless s1.include? char

    s1.sub!(char, '')
  end
  true
end

# Solution 3
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

# Solution 4
def scramble(s1,s2)
  a1 = s1.split("").sort
  a2 = s2.split("").sort  # the word we're looking for
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


# Solution 5

def scramble(s1, s2)
  s2.chars.all? { |c| s1.sub!(c, '') }
end

p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

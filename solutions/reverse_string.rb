# Standard Ruby String method :)
def reverse_string(s)
  s.reverse!
end

# Using Times method to swap elements
def reverse_string(s)
  (s.length / 2).times do |i|
    current = s[i]
    s[i] = s[s.length - 1 - i]
    s[s.length - 1 - i] = current
  end
end

# Using two pointers to swap elements
def reverse_string(s)
  left = 0
  right = s.size - 1
  while left < right
    s[left], s[right] = s[right], s[left]
    left += 1
    right -= 1
  end
end
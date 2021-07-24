# https://leetcode.com/problems/palindrome-linked-list/
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end

# method to create linked list from array - returns head
def array_to_ll(array)
  return if array.empty?
  return ListNode.new(array.shift, array_to_ll(array))
end


# 1. Array and two pointers solution
def is_palindrome?(head)
  # move values into array
  cur = head
  values=[]
  count = 0
  while cur
    count += 1
    values << cur.val
    cur = cur.next
  end
  # "two pointers" to check from front and back
  palindrome = true
  (count / 2).times do |i|
      if array[i] != array[count - 1 - i]
          palindrome = false
          break
      end
  end
  palindrome
end


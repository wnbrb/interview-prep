# https://leetcode.com/problems/palindrome-linked-list/
# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val = 0, _next = nil)
#       @val = val
#       @next = _next
#   end
# end

# 3. Reverse Second Half In-place
# this is a solution with space complexity of O(1)
# Find the middle of the list
# Reverse the second half in place
# then with two pointers - one starting at the first element and one at the beginning of the second half
# check if the values are the same
# afterwards put the secon half back into the correct order

def is_palindrome?(head)
  return true if head.nil?

  # Find the end of first half and reverse second half.
  first_half_end = end_of_first_half(head)
  second_half_start = reverse_list(first_half_end.next)

  # Check whether or not there is a palindrome.
  p1 = head
  p2 = second_half_start
  result = true
  while result && !p2.nil?
      if p1.val != p2.val
          result = false
      end
      p1 = p1.next
      p2 = p2.next
  end

  # Restore the list and return the result.
  first_half_end.next = reverse_list(second_half_start)
  result
end

def reverse_list(head)
  prev = nil
  cur = head

  while !cur.nil?
      next_temp = cur.next
      cur.next = prev
      prev = cur
      cur = next_temp
  end

  return prev
end

def end_of_first_half(node)
  # two pointers: 'slow' will move one node at the time
  # 'fast' will move two
  # once 'fast' reaches the end, 'slow' will be in the middle
  slow = node
  fast = node
  while !fast.next.nil? && !fast.next.next.nil?
      fast = fast.next.next
      slow = slow.next
  end

  return slow
end
# https://leetcode.com/problems/palindrome-linked-list/
# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val = 0, _next = nil)
#       @val = val
#       @next = _next
#   end
# end

# 2. Recursive solution
def is_palindrome?(head)
  @front = head
  check_recursively(head)
end

def check_recursively(current_node)
  if current_node
      return false if !check_recursively(current_node.next)
      return false if current_node.val != @front.val
      @front = @front.next
  end
  true
end

# extra - print reverse
# use a recursive function to print the values of a linked list in reverse order
# shows how to do things to elements in linked list in reverse order

def print_in_reverse(head)
    if !head.nil?
        print_in_reverse(head.next)
        p head.val
    end
end
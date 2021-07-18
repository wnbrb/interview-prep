# https://leetcode.com/problems/merge-two-sorted-lists/

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

# iterative solution
def merge_two_lists(l1, l2)
  list1 = l1
  list2 = l2

  new_head = ListNode.new(-1)
  prev = new_head

  while list1 || list2
    if list1.val <= list2.val
      prev.next = list1
      prev = list1 # prev = prev.next
      list1 = list1.next
    else
      prev.next = list2
      prev = list2
      list2 = list2.next
    end
  end

  new_head.next
end

# recursive solution
def merge_two_lists(l1, l1)
  return l2 if l1.nil?
  return l1 if l2.nil?

  if l1.val < l2.val
    l1.next = merge_two_lists(l1.next, l2)
    return l1
  else
    l2.next = merge_two_lists(l1, l2.next)
    return l2
  end
end

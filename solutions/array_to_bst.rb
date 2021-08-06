# Definition for a binary tree node.
# https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
#
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}

# [-10,-3,0,5,9]

def sorted_array_to_bst(nums)
  return if nums.empty?

  middle = nums.length / 2
  root = TreeNode.new(nums[middle])
  root.left = sorted_array_to_bst(nums[0...middle])
  root.right = sorted_array_to_bst(nums[middle + 1..-1])
  root
end


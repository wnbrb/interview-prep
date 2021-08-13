# https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}

def zigzag_level_order(root)
  return [] unless root

  ans = []
  q = []
  q << root if root
  q << nil
  level_list = []
  is_order_left = true

  while !q.empty?
    cur = q.shift
    if cur
       # add val to level list - to beginning or end depending on level
       is_order_left ? level_list.push(cur.val) : level_list.unshift(cur.val)

       # add children to queue
        q.push(cur.left) if cur.left
        q.push(cur.right) if cur.right
    else
        # finish scan of the level
        ans << level_list
        level_list = []

        if !q.empty?
            q.push(nil)
            is_order_left = !is_order_left
        end
    end
  end
  ans
end
//
//  剑指 Offer 55 - II. 平衡二叉树.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/5.
//

import Foundation
/**
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。

  

 示例 1:

 给定二叉树 [3,9,20,null,null,15,7]

     3
    / \
   9  20
     /  \
    15   7
 返回 true 。

 示例 2:

 给定二叉树 [1,2,2,3,3,null,null,4,4]

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 返回 false 。

  

 限制：

 1 <= 树的结点个数 <= 10000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func isBalanced(_ root: TreeNode?) -> Bool {
    return isBalanced(root).0
}
func isBalanced(_ root: TreeNode?) -> (Bool, Int) {
    guard let root = root else {
        return (true, 0)
    }
    if root.left == nil && root.right == nil {
        return (true, 1)
    }
    var leftResult: (Bool, Int) = isBalanced(root.left)
    leftResult.1 += 1
    var rightResult: (Bool, Int) = isBalanced(root.right)
    rightResult.1 += 1
    var isBalancedResult = false
    if leftResult.0 && rightResult.0 && abs(leftResult.1 - rightResult.1) <= 1 {
        isBalancedResult = true
    }
    return (isBalancedResult, max(leftResult.1, rightResult.1))
}

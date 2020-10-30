//
//  剑指 Offer 26. 树的子结构 .swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/29.
//

import Foundation
/**
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)

 B是A的子结构， 即 A中有出现和B相同的结构和节点值。

 例如:
 给定的树 A:

      3
     / \
    4   5
   / \
  1   2
 给定的树 B：

    4
   /
  1
 返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。

 示例 1：

 输入：A = [1,2,3], B = [3,1]
 输出：false
 示例 2：

 输入：A = [3,4,5,1,2], B = [4,1]
 输出：true


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
    guard let A = A, let B = B else {
        return false
    }
    return isSubStructure(A, B) || isSubStructure(A.left, B) || isSubStructure(A.right, B)
}

func isSubStructure(_ A: TreeNode, _ B: TreeNode) -> Bool {
    if A.val != B.val {
        return false
    }
    if let BLeft = B.left, let BRight = B.right { //b左右都不为空
        if let ALeft = A.left, let ARight = A.right  {
            return isSubStructure(ALeft, BLeft) && isSubStructure(ARight, BRight)
        }
    } else if let BLeft = B.left { //b左不空
        if let ALeft = A.left  {
            return isSubStructure(ALeft, BLeft)
        }
    } else if let BRight = B.right { //b右不空
        if  let ARight = A.right  {
            return isSubStructure(ARight, BRight)
        }
    } else { //b左右都空
        return true
    }
    if B.left == nil && B.right == nil {
        return true
    }
    return false
}

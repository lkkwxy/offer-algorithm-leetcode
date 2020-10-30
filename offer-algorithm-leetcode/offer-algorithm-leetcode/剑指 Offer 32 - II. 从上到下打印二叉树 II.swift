//
//  剑指 Offer 32 - II. 从上到下打印二叉树 II.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/30.
//

import Foundation
/**
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func levelOrder2(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    var result = [[Int]]()
    var stack = [root]
    while !stack.isEmpty {
        var tmpResult = [Int]()
        var tmpStack = [TreeNode]()
        for item in stack {
            tmpResult.append(item.val)
            if let left = item.left {
                tmpStack.append(left)
            }
            if let right = item.right {
                tmpStack.append(right)
            }
        }
        stack = tmpStack
        result.append(tmpResult)
    }
    return result
}

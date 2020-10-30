//
//  剑指 Offer 32 - I. 从上到下打印二叉树.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/30.
//

import Foundation
/**
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

  

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回：

 [3,9,20,15,7]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func levelOrder(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    var stack = [root]
    var result = [Int]()
    while !stack.isEmpty {
        var tmpStack = [TreeNode]()
        for item in stack {
            result.append(item.val)
            if let left = item.left {
                tmpStack.append(left)
            }
            if let right = item.right {
                tmpStack.append(right)
            }
        }
        stack = tmpStack
    }
    return result
}

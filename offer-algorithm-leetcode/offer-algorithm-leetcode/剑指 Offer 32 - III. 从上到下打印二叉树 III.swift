//
//  剑指 Offer 32 - III. 从上到下打印二叉树 III.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/30.
//

import Foundation
/**
 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。

  

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
   [20,9],
   [15,7]
 ]
  

 提示：

 节点总数 <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    var i = 0
    var result = [[Int]]()
    var stack = [root]
    while !stack.isEmpty {
        let count = stack.count
        var tmpResult = Array(repeating: 0, count: count)
        var tmpStack = [TreeNode]()
        let isOdd = i % 2 == 1
        for j in 0..<stack.count {
            let item = stack[j]
            if let left = item.left {
                tmpStack.append(left)
            }
            
            if let right = item.right {
                tmpStack.append(right)
            }
            if isOdd {
                tmpResult[count - j - 1] = item.val
            } else {
                tmpResult[j] = item.val
            }
        }
        i += 1
        result.append(tmpResult)
        stack = tmpStack
    }
    return result
}

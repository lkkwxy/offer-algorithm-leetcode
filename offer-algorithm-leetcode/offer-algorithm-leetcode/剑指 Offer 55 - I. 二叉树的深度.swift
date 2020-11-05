//
//  剑指 Offer 55 - I. 二叉树的深度.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/5.
//

import Foundation
/**
 输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

 例如：

 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

  

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
// 利用递归实现
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}
// 利用层序遍历
func maxDepth1(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    var depth = 0
    var array = [root]
    while !array.isEmpty {
        depth += 1
        var tmpArray = [TreeNode]()
        for node in array {
            if let leftNode = node.left {
                tmpArray.append(leftNode)
            }
            if let rightNode = node.right {
                tmpArray.append(rightNode)
            }
        }
        array = tmpArray
    }
    return depth
}

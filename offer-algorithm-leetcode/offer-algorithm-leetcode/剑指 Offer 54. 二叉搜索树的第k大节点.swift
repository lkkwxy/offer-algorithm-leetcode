//
//  剑指 Offer 54. 二叉搜索树的第k大节点.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/4.
//

import Foundation
func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
    var curNode = root
    var stack = [TreeNode]()
    var count = 0
    var result = -1
    while curNode != nil || !stack.isEmpty {
        if let rightNode = curNode?.right {
            stack.append(curNode!)
            curNode = rightNode
        } else {
            if let cur = curNode {
                count += 1
                result = cur.val
                curNode = cur.left
            } else if let parent = stack.popLast() {
                count += 1
                result = parent.val
                curNode = parent.left
            }
            if k == count {
                break
            }
        }
    }
    return result
}

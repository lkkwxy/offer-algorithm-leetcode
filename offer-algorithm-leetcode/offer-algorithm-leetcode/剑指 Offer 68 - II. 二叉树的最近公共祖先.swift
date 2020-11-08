//
//  剑指 Offer 68 - II. 二叉树的最近公共祖先.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/8.
//

import Foundation

func lowestCommonAncestor3(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    if root === p || root === q {
        return root
    }
    let leftResult = lowestCommonAncestor(root.left, p, q)
    let rightResult = lowestCommonAncestor(root.right, p, q)
    if leftResult != nil && rightResult != nil {
        return root
    }
    return leftResult ?? rightResult
}


func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }

    var nodes = [root]
    var map = [Int: TreeNode]()
    var visted = [root.val: true]
    
    while !nodes.isEmpty {
        var tmp = [TreeNode]()
        for node in nodes {
            if let leftNode = node.left {
                map[leftNode.val] = node
                tmp.append(leftNode)
            }
            if let rightNode = node.right {
                map[rightNode.val] = node
                tmp.append(rightNode)
            }
        }
        nodes = tmp
    }
    var p = p
    while p != nil {
        visted[p!.val] = true
        p = map[p!.val]
    }
    var q = p
    while q != nil {
        if visted[q!.val] == true {
            return q
        }
        q = map[q!.val]
    }
    return nil
}

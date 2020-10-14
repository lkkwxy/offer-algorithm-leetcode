//
//  105. 从前序与中序遍历序列构造二叉树.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/14.
//

import Foundation
/**
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
 
 */
class Solution {
    public class TreeNode {
         public var val: Int
         public var left: TreeNode?
         public var right: TreeNode?
         public init(_ val: Int) {
             self.val = val
             self.left = nil
             self.right = nil
         }
     }
    var preorder = [Int]()
    var inorder = [Int]()
    var mapInorder = [Int: Int]()
    var mapPreorder = [Int: Int]()
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        self.preorder = preorder
        self.inorder = inorder
        var i = 0
        for item in inorder {
            mapInorder[item] = i
            i += 1
        }
        i = 0
        for item in preorder {
            mapPreorder[item] = i
            i += 1
        }
        return buildTree(0, 0, preorder.count)
    }

    func buildTree(_ preorderStartIndex: Int, _ inorderStartIndex: Int, _ count: Int) -> TreeNode? {
        if count < 1 {
            return nil
        } else if count == 1 {
            return TreeNode(preorder[preorderStartIndex])
        } else {
            let node = TreeNode(preorder[preorderStartIndex])
            let rootIndex = mapInorder[preorder[preorderStartIndex]]!
            let leftCount = rootIndex - inorderStartIndex
            node.left = buildTree(preorderStartIndex + 1, inorderStartIndex, leftCount)
            let rightCount = count - leftCount - 1
            node.right = buildTree(preorderStartIndex + 1 + leftCount, rootIndex + 1, rightCount)
            return node
        }
    }
}

//
//  剑指 Offer 36. 二叉搜索树与双向链表.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/1.
//

import Foundation
/**
 /**
  * // Definition for a Node.
  * function Node(val,left,right) {
  *    this.val = val;
  *    this.left = left;
  *    this.right = right;
  * };
  */
 /**
  * @param {Node} root
  * @return {Node}
  */
 var treeToDoublyList = function(root) {
     var stack = []
     var curNode = root
     var head = null
     var lastNode = null
     var perviousNode = null
     while (stack.length > 0 || curNode) {
         if(curNode && curNode.left) {
             stack.push(curNode)
             curNode = curNode.left
         } else {
             // console.log("======" + curNode.val)
             if(head == null) {
                 head = curNode
             }
             if(lastNode && curNode && lastNode != curNode) {
                 curNode.left = lastNode
                 lastNode.right = curNode
             }
             if(curNode) {
                 lastNode = curNode
             }
             if(curNode && curNode.right) {
                 curNode = curNode.right
             }else if(stack.length > 0) {
                 var parentNode = stack.pop()
                 if (lastNode) {
                     parentNode.left = lastNode
                     lastNode.right = parentNode
                 }
                 lastNode = parentNode
                 curNode = parentNode.right
             } else {
                 curNode = null
             }
         }
     }
     if(head) {
         head.left = lastNode
         lastNode.right = head
     }
     return head
 };
 */
func treeToDoublyList(_ root: TreeNode?) -> TreeNode? {
    var curNode = root
    var stack = [TreeNode]()
    var head: TreeNode?
    var last: TreeNode?
    while !stack.isEmpty || curNode != nil {
        if let leftNode = curNode?.left {
            stack.append(curNode!)
            curNode = leftNode
        } else {
            if let last = last, let curNode = curNode, last !== curNode {
                curNode.left = last
                last.right = curNode
            }
            if curNode != nil {
                if head == nil {
                    head = curNode
                }
                last = curNode
            }
            if let rightNode = curNode?.right {
                curNode = rightNode
            } else if !stack.isEmpty {
                let parentNode = stack.removeLast()
                last?.right = parentNode
                parentNode.left = last
                last = parentNode
                curNode = parentNode.right
            } else {
                curNode = nil
            }
        }
    }
    head?.left = last
    last?.right = head
    return head
}
func testTreeToDoublyList() {
    let node0 = TreeNode(2, TreeNode(1), nil)
    let node1 = treeToDoublyList(node0)
    assert(node1!.val == 1)
    assert(node1!.right!.right === node1!)
    let node2 = TreeNode(2, nil , TreeNode(3))
    let node3 = treeToDoublyList(node2)
    assert(node3!.val == 2)
    assert(node3!.right!.right === node3!)
    
    let node4 = TreeNode(8, TreeNode(-6,TreeNode(-8)) , nil)
    let node5 = treeToDoublyList(node4)
    assert(node5!.val == -8)
    assert(node5!.right!.right!.val == 8)
    assert(node5!.right!.right!.right === node5)
    
    let node6 = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)) , TreeNode(5))
    let node7 = treeToDoublyList(node6)
    assert(node7!.val == 1)
    assert(node7!.right!.val == 2)
    assert(node7!.right!.right!.val == 3)
    assert(node7!.right!.right!.right!.val == 4)
    assert(node7!.right!.right!.right!.right!.val == 5)
    assert(node7!.right!.right!.right!.right!.right === node7)
}

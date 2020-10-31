//
//  剑指 Offer 35. 复杂链表的复制.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/31.
//

import Foundation
/**
 请实现 copyRandomList 函数，复制一个复杂链表。在复杂链表中，每个节点除了有一个 next 指针指向下一个节点，还有一个 random 指针指向链表中的任意节点或者 null。

  

 示例 1：



 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
 示例 2：



 输入：head = [[1,1],[2,1]]
 输出：[[1,1],[2,1]]
 示例 3：



 输入：head = [[3,null],[3,0],[3,null]]
 输出：[[3,null],[3,0],[3,null]]
 示例 4：

 输入：head = []
 输出：[]
 解释：给定的链表为空（空指针），因此返回 null。
  

 提示：

 -10000 <= Node.val <= 10000
 Node.random 为空（null）或指向链表中的节点。
 节点数目不超过 1000 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/fu-za-lian-biao-de-fu-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

/**
 /// js的实现，由于本题leetCode不支持Swift，用js进行验证
 var copyRandomList = function(head) {
     var curNode = head
     var result = null
     var map = new Map()
     while (curNode) {
         var node = map.get(curNode)
         if (!node) {
             node = new Node(curNode.val,null,null)
             map.set(curNode, node)
         }

         if (curNode.random) {
             var randomNode = map.get(curNode.random)
             if (randomNode) {
                 node.random = randomNode
             } else {
                 randomNode = new Node(curNode.random.val,null,null)
                 node.random = randomNode
                 map.set(curNode.random, randomNode)
             }
         }
         if (curNode.next) {
             var nextNode = map.get(curNode.next)
             if (nextNode) {
                 node.next = nextNode
             } else {
                 nextNode = new Node(curNode.next.val,null,null)
                 node.next = nextNode
                 map.set(curNode.next, nextNode)
             }
         }
         curNode = curNode.next
         if (!result) {
             result = node
         }
     }
     return result
 };
 */
class RandomNode: Hashable {
    static func == (lhs: RandomNode, rhs: RandomNode) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(Unmanaged<RandomNode>.passUnretained(self).toOpaque())
    }
    
    var val: Int
    var next: RandomNode?
    var random: RandomNode?
    init(val: Int, next: RandomNode? = nil, random: RandomNode? = nil) {
        self.val = val
        self.next = next
        self.random = random
    }
    
    func copy() -> RandomNode {
        var map = [RandomNode: RandomNode]()
        var curNode: RandomNode? = self
        var result: RandomNode?
        while curNode != nil {
            var node = map[curNode!]
            if node == nil {
                node = RandomNode(val: curNode!.val)
                map[curNode!] = node
            }
            if curNode!.next != nil {
                var nextNode = map[curNode!.next!]
                if nextNode == nil {
                    nextNode = RandomNode(val: curNode!.next!.val)
                    map[curNode!.next!] = nextNode
                }
                node!.next = nextNode
            }
            
            if curNode!.random != nil {
                var randomNode = map[curNode!.random!]
                if randomNode == nil {
                    randomNode = RandomNode(val: curNode!.random!.val)
                    map[curNode!.random!] = randomNode
                }
                node!.random = randomNode
            }
            curNode = curNode?.next
            if result == nil {
                result = node
            }
        }
        return result!
    }
}
/// 测试代码
func testRandomNode() {
    let node1 = RandomNode(val: 7, next: nil, random: nil)
    let node2 = RandomNode(val: 13, next: nil, random: node1)
    let node3 = RandomNode(val: 11, next: nil, random: nil)
    let node4 = RandomNode(val: 10, next: nil, random: node3)
    let node5 = RandomNode(val: 1, next: nil, random: node1)
    node3.random = node5
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    let node6 = node1.copy()
    let node7 = node6.next!
    let node8 = node7.next!
    let node9 = node8.next!
    let node10 = node9.next!
    assert(node6.val == node1.val)
    assert(node7.val == node2.val)
    assert(node8.val == node3.val)
    assert(node9.val == node4.val)
    assert(node10.val == node5.val)
    assert(node6 != node1)
    assert(node7 != node2)
    assert(node8 != node3)
    assert(node9 != node4)
    assert(node10 != node5)
    assert(node7.random == node6)
    assert(node10.random == node6)
    assert(node9.random == node8)
}

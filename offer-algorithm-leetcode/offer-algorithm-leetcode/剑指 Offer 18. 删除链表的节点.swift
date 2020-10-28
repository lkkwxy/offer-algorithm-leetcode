//
//  剑指 Offer 18. 删除链表的节点.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/28.
//

import Foundation
/**
 给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。

 返回删除后的链表的头节点。

 注意：此题对比原题有改动

 示例 1:

 输入: head = [4,5,1,9], val = 5
 输出: [4,1,9]
 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
 示例 2:

 输入: head = [4,5,1,9], val = 1
 输出: [4,5,9]
 解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    var currentNode = head
    var resultNode = head
    var perviousNode: ListNode?
    while currentNode != nil {
        if currentNode!.val == val {
            if perviousNode == nil {
                resultNode = head?.next
                head?.next = nil
            } else {
                perviousNode?.next = currentNode?.next
                currentNode?.next = nil
            }
            break
        }
        perviousNode = currentNode
        currentNode = currentNode?.next
    }
    return resultNode
}

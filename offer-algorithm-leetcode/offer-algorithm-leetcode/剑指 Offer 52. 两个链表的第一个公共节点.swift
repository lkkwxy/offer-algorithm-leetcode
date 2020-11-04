//
//  剑指 Offer 52. 两个链表的第一个公共节点.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/4.
//

import Foundation
/**
 js实现
 var getIntersectionNode = function(headA, headB) {
     var curA = headA
     var curB = headB
     while (curA != curB) {
         curA = curA == null ? headB : curA.next
         curB = curB == null ? headA : curB.next
     }
     return curA
 };
 */
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var curA = headA
    var curB = headB
    while curA !== curB {
        curA = curA == nil ? headB : curA?.next
        curB = curB == nil ? headA : curB?.next
    }
    return curA
}
func testGetIntersectionNode() {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    node1.next = node2
    node2.next = node3
    node4.next = node3
    node3.next = node5
    let node = getIntersectionNode(node1, node4)
    assert(node! === node3)
    
    let node6 = ListNode(6)
    let node7 = ListNode(7)
    let node8 = ListNode(8)
    let node9 = ListNode(9)
    let node10 = ListNode(10)
    node6.next = node7
    node7.next = node8
    node9.next = node10
    assert(getIntersectionNode(node6, node10) === nil)
}

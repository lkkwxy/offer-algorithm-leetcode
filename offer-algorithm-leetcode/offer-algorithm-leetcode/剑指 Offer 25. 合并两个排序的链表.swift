//
//  剑指 Offer 25. 合并两个排序的链表.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/29.
//

import Foundation
/**
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 示例1：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 限制：

 0 <= 链表长度 <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    let l = ListNode(0)
    var currentNode: ListNode? = l
    while l1 != nil && l2 != nil {
        if l1!.val > l2!.val  {
            currentNode?.next = l2
            l2 = l2!.next
        } else {
            currentNode?.next = l1
            l1 = l1!.next
        }
        currentNode = currentNode?.next
    }
    if l1 == nil {
        currentNode?.next = l2
    } else {
        currentNode?.next = l1
    }
    return l.next
}

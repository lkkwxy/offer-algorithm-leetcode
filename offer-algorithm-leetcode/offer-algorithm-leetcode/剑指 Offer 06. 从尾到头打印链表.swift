//
//  剑指 Offer 06. 从尾到头打印链表.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/13.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reversePrint(_ head: ListNode?) -> [Int] {
    var result = [Int]()
    var current = head
    while current != nil {
        result.append(current!.val)
        current = current?.next
    }
    return result.reversed()
}

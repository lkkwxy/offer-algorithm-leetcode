//
//  剑指 Offer 59 - II. 队列的最大值.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/7.
//

import Foundation
class MaxQueue {
    private var header = ListNode(0)
    private var footer: ListNode?
    private var maxNumbers = [Int]()
    init() {
        
    }
    
    func max_value() -> Int {
        return maxNumbers.first ?? -1
    }
    
    func push_back(_ value: Int) {
        if footer == nil {
            footer = ListNode(value)
            header.next = footer
        } else {
            footer?.next = ListNode(value)
            footer = footer?.next
        }
        if let first = maxNumbers.first {
            if first < value {
                maxNumbers = [value]
            } else {
                var isBreak = false
                for i in 1..<maxNumbers.count {
                    if maxNumbers[i] < value {
                        maxNumbers[i...] = [value]
                        isBreak = true
                        break
                    }
                }
                if !isBreak {
                    maxNumbers.append(value)
                }
            }
            
        } else {
            maxNumbers = [value]
        }
    }
    
    func pop_front() -> Int {
        guard let headerNext = header.next else {
            return -1
        }
        if headerNext === footer {
            footer = nil
        }
        if headerNext.val == maxNumbers.first {
            maxNumbers.removeFirst()
        }
        header.next = header.next?.next
        return headerNext.val
    }
}

class MaxQueue1 {
    private var header = ListNode(0)
    private var footer: ListNode?
    private var maxNode = ListNode(0)
    init() {
        
    }
    
    func max_value() -> Int {
        return maxNode.next?.val ?? -1
    }
    
    func push_back(_ value: Int) {
        if footer == nil {
            footer = ListNode(value)
            header.next = footer
        } else {
            footer?.next = ListNode(value)
            footer = footer?.next
        }
        if let first = maxNode.next?.val {
            if first < value {
                maxNode.next = ListNode(value)
            } else {
                var curNode = maxNode.next
                var perviousNode: ListNode? = curNode
                while curNode != nil {
                    if curNode!.val < value {
                        break
                    }
                    perviousNode = curNode
                    curNode = curNode?.next
                }
                perviousNode?.next = ListNode(value)
            }
            
        } else {
            maxNode.next = ListNode(value)
        }
    }
    
    func pop_front() -> Int {
        guard let headerNext = header.next else {
            return -1
        }
        if headerNext === footer {
            footer = nil
        }
        if headerNext.val == maxNode.next?.val {
            maxNode.next = maxNode.next?.next
        }
        header.next = header.next?.next
        return headerNext.val
    }
}



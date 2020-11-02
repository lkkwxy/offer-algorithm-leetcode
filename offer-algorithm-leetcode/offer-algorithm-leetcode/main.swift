//
//  main.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/10.
//

import Foundation
/// leetCode地址：https://leetcode-cn.com/problemset/lcof/
/// 剑指 Offer 03. 数组中重复的数字
print(findRepeatNumber([2, 3, 1, 0, 2, 5, 3]))

/// 剑指 Offer 04. 二维数组中的查找
var matrix = [[-5]]
print(findNumberIn2DArray(matrix, -5))

/// 剑指 Offer 05. 替换空格
print(replaceSpace("We are0 happy."))

print(movingCount(2, 3, 9))
print(cuttingRope2(10))
print(isMatch("", ".*"))
print(isNumber("."))
print(exchange([1]))
print(spiralOrder([[7,8,9]]))


print(verifyPostorder([4, 8, 6, 12, 16, 14, 10]))
print(testRandomNode())
testSerializeTreeNode()
testTreeToDoublyList()
print(permutation("abc"))

let a = MedianFinder()
a.addNum(6)
print(a.findMedian())
a.addNum(10)
print(a.findMedian())
a.addNum(2)
print(a.findMedian())
a.addNum(6)
print(a.findMedian())
a.addNum(5)
print(a.findMedian())
a.addNum(0)
print(a.findMedian())
a.addNum(6)
print(a.findMedian())
a.addNum(3)
print(a.findMedian())
a.addNum(1)
print(a.findMedian())
a.addNum(0)
print(a.findMedian())
a.addNum(0)
print(a.findMedian())

findNthDigit(19)

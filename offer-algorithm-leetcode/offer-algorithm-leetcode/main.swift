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

//minNumber([4704,6306,9385,7536,3462,4798,5422,5529,8070,6241,9094,7846,663,6221,216,6758,8353,3650,3836,8183,3516,5909,6744,1548,5712,2281,3664,7100,6698,7321,4980,8937,3163,5784,3298,9890,1090,7605,1380,1147,1495,3699,9448,5208,9456,3846,3567,6856,2000,3575,7205,2697,5972,7471,1763,1143,1417,6038,2313,6554,9026,8107,9827,7982,9685,3905,8939,1048,282,7423,6327,2970,4453,5460,3399,9533,914,3932,192,3084,6806,273,4283,2060,5682,2,2362,4812,7032,810,2465,6511,213,2362,3021,2745,3636,6265,1518,8398])
print(translateNum(25))

print(lengthOfLongestSubstring("abba"))

testGetIntersectionNode()
singleNumber([3,4,4,4])

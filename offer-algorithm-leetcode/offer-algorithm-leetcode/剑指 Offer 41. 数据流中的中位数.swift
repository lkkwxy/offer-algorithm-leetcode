//
//  剑指 Offer 41. 数据流中的中位数.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation
/**
 
 如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。

 例如，

 [2,3,4] 的中位数是 3

 [2,3] 的中位数是 (2 + 3) / 2 = 2.5

 设计一个支持以下两种操作的数据结构：

 void addNum(int num) - 从数据流中添加一个整数到数据结构中。
 double findMedian() - 返回目前所有元素的中位数。
 示例 1：

 输入：
 ["MedianFinder","addNum","addNum","findMedian","addNum","findMedian"]
 [[],[1],[2],[],[3],[]]
 输出：[null,null,null,1.50000,null,2.00000]
 示例 2：

 输入：
 ["MedianFinder","addNum","findMedian","addNum","findMedian"]
 [[],[2],[],[3],[]]
 输出：[null,null,2.00000,null,2.50000]
 */
class MedianFinder {
    private var nums = [Int]()
    /** initialize your data structure here. */
    init() {

    }
    
    func addNum(_ num: Int) {
        if nums.isEmpty {
            nums.append(num)
            return
        }
        var startIndex = 0
        var endIndex = nums.count - 1
        var midIndex = (endIndex  - startIndex) / 2 + startIndex
        while startIndex < endIndex {
            if num == nums[midIndex] {
                break
            } else if num > nums[midIndex] {
                startIndex = midIndex + 1
                midIndex = (endIndex  - startIndex) / 2 + startIndex
            } else {
                endIndex = midIndex
                midIndex = (endIndex  - startIndex) / 2 + startIndex
            }
        }
        if num > nums[midIndex] {
            nums.insert(num, at: midIndex + 1)
        } else {
            nums.insert(num, at: midIndex)
        }
    }
    
    func findMedian() -> Double {
        guard !nums.isEmpty else {
            return 0
        }
        if nums.count % 2 == 0 {
            return Double(nums[nums.count / 2] + nums[nums.count / 2 - 1]) / 2
        } else {
            return Double(nums[nums.count / 2])
        }
    }
}

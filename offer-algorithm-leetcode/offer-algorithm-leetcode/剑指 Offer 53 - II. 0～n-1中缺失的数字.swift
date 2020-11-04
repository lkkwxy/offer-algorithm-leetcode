//
//  剑指 Offer 53 - II. 0～n-1中缺失的数字.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/4.
//

import Foundation
func missingNumber(_ nums: [Int]) -> Int {
    var start = 0
    var end = nums.count - 1
    var mid = (end - start) / 2 + start
    while start <= end {
        if nums[mid] == mid {
            start = mid + 1
            mid = (end - start) / 2 + start
        } else if mid == 0 || nums[mid - 1] == mid - 1 {
            return mid
        } else {
            end = mid - 1
            mid = (end - start) / 2 + start
        }
    }
    return nums.count
}

//
//  剑指 Offer 53 - I. 在排序数组中查找数字 I.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/4.
//

import Foundation
func search(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    var mid = (end - start / 2) + start
    var targetIndex = -1
    while start <= end {
        if nums[mid] == target {
            targetIndex = mid
            break
        } else if nums[mid] > target {
            end = mid - 1
            mid = (end - start / 2) + start
        } else {
            start = mid + 1
            mid = (end - start / 2) + start
        }
    }
    print(targetIndex)
    if targetIndex == -1 {
        return 0
    }
    var count = 0
    for i in targetIndex..<nums.count {
        if nums[i] != target {
            break
        }
        count += 1
    }
    for i in stride(from:targetIndex-1, to:-1, by: -1) {
        if nums[i] != target {
            break
        }
        count += 1
    }
    return count
}

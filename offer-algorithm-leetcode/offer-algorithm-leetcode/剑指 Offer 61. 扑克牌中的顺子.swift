//
//  剑指 Offer 61. 扑克牌中的顺子.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/7.
//

import Foundation
func isStraight(_ nums: [Int]) -> Bool {
    let nums = nums.sorted()
    var zeroCount = 0
    for i in 0...3 {
        if nums[i] == 0 {
            zeroCount += 1
        } else if nums[i + 1] - nums[i] == 0 {
            return false
        } else if nums[i + 1] - nums[i] > 1 {
            zeroCount -= nums[i + 1] - nums[i]
        }
    }
    return zeroCount >= 0
}

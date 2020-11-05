//
//  剑指 Offer 57 - II. 和为s的连续正数序列.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/5.
//

import Foundation
func findContinuousSequence(_ target: Int) -> [[Int]] {
    let n = Int(sqrt(Double(target * 2) + 0.25) - 0.5)
    var sum = n * (n + 1) / 2
    var i = 1
    var result = [[Int]]()
    if sum == target {
        result.append(Array(1...n))
    }
    for j in n + 1...(target + 1)/2 {
        sum = sum + j
        if sum == target {
            result.append(Array(i + 1...j))
        } else {
            while sum > target {
                sum = sum - i
                i += 1
            }
            if sum == target {
                result.append(Array(i...j))
            }
        }
     }
    return result
}

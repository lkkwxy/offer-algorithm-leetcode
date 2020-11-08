//
//  剑指 Offer 62. 圆圈中最后剩下的数字.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/7.
//

import Foundation
func lastRemaining(_ n: Int, _ m: Int) -> Int {
    if n <= 1 || m < 1 {
        return 0
    }
    var last = 0
    for i in 2...n {
        last = (last + m) % i
    }
    return last
}

func lastRemaining1(_ n: Int, _ m: Int) -> Int {
    if n <= 1 || m < 1 {
        return 0
    }
    
    var result = Array(0...n-1)
    var startIndex = 0
    while result.count != 1 {
        startIndex = (m - 1 + startIndex) % result.count
        result.remove(at: startIndex)
    }
    return result[0]
}

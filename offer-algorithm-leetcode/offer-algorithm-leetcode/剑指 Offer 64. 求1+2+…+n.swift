//
//  剑指 Offer 64. 求1+2+…+n.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/5.
//

import Foundation
func sumTeminator(_ n: Int) -> Int {
    return 0
}

func sumNums2(_ n: Int) -> Int {
    let sumFuncs = [sumTeminator, sumNums2]
    let funcIndex = Int(truncating: NSNumber(value: Bool(truncating: NSNumber(value: n - 1))))
    return n + sumFuncs[funcIndex](n - 1)
}


func sumNums1(_ n: Int) -> Int {
    let array = NSArray(array: Array(0...n))
    let sum = array.value(forKeyPath: "@sum.integerValue") as! Int
    return sum
}

func sumNums(_ n: Int) -> Int {
    return Array(1...n).reduce(0) { $0 + $1 }
}


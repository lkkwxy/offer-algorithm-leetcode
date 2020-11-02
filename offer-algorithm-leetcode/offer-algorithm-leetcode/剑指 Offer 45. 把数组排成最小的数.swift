//
//  剑指 Offer 45. 把数组排成最小的数.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation
func minNumber(_ nums: [Int]) -> String {
    return nums.sorted { (num1, num2) -> Bool in
        if num1 == num2 { return true }
        let num1Chars = "\(num1)".utf8CString.dropLast()
        let num2Chars = "\(num2)".utf8CString.dropLast()
        let count = min(num1Chars.count, num2Chars.count)
        for i in 0..<count {
            if num1Chars[i] > num2Chars[i] {
                return false
            } else if num1Chars[i] < num2Chars[i] {
                return true
            }
        }
        if num1Chars.count == num2Chars.count {
            return true
        } else {
            let numsChar = num1Chars.count > num2Chars.count ? num1Chars : num2Chars
            for i in 0...count-1 {
                if numsChar[count] > numsChar[i] {
                    return num1Chars.count > num2Chars.count ? false : true
                } else if numsChar[count] < numsChar[i] {
                    return num1Chars.count > num2Chars.count ? true : false
                }
            }
            for i in count..<numsChar.count {
                if numsChar[count] < numsChar[i] {
                    return num1Chars.count > num2Chars.count ? false : true
                } else if numsChar[count] > numsChar[i] {
                    return num1Chars.count > num2Chars.count ? true : false
                }
            }
        }
        return false
    }.reduce("") { (result, item) -> String in
        return result + "\(item)"
    }
}


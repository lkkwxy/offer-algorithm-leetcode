//
//  剑指 Offer 67. 把字符串转换成整数 .swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/8.
//

import Foundation
func strToInt(_ str: String) -> Int {
    var map = [String.Element : Int]()
    for i in 0...9 {
        map[Character("\(i)")] = i
    }
    var res = 0
    var str = str.trimmingCharacters(in: .whitespaces)
    var isNegative = false
    if str.starts(with: "-") || str.starts(with: "+") {
        isNegative = str.starts(with: "-")
        str.remove(at: str.startIndex)
    }
    
    for item in str {
        if item >= "0" && item <= "9" {
            if isNegative {
                res = res * 10 - map[item]!
                if res < Int32.min {
                    return Int(Int32.min)
                }
            } else {
                res = res * 10 + map[item]!
                if res > Int32.max {
                    return Int(Int32.max)
                }
            }
        } else {
            break
        }
    }
    return res
}


func strToInt1(_ str: String) -> Int {
    var map = [String.Element : Int]()
    for i in 0...9 {
        map[Character("\(i)")] = i
    }
    var res = 0
    var str = str.trimmingCharacters(in: .whitespaces)
    var isNegative = false
    if str.starts(with: "-") || str.starts(with: "+") {
        isNegative = str.starts(with: "-")
        str.remove(at: str.startIndex)
    }
    if isNegative {
        for item in str {
            if item >= "0" && item <= "9" {
                res = res * 10 - map[item]!
                if res < Int32.min {
                    return Int(Int32.min)
                }
            } else {
                break
            }
        }
    } else {
        for item in str {
            if item >= "0" && item <= "9" {
                res = res * 10 + map[item]!
                if res > Int32.max {
                    return Int(Int32.max)
                }
            } else {
                break
            }
        }
    }
    return res
}


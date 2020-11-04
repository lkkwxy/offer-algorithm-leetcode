//
//  剑指 Offer 50. 第一个只出现一次的字符.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/4.
//

import Foundation
/**
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

 示例:

 s = "abaccdeff"
 返回 "b"

 s = ""
 返回 " "
  

 限制：

 0 <= s 的长度 <= 50000



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func firstUniqChar(_ s: String) -> Character {
    var map = [String.Element: Int]()
    for (index, value) in s.enumerated() {
        if !map.keys.contains(value) {
            map[value] = index
        } else {
            map[value] = -1
        }
    }
    var minIndex = Int.max
    var result = Character(" ")
    for (key, value) in map {
        if value != -1 && value < minIndex {
            result = key
            minIndex = value
        }
    }
    return result
}

//
//  剑指 Offer 58 - I. 翻转单词顺序.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/5.
//

import Foundation
func reverseWords(_ s: String) -> String {
   return s.split(separator: " ").reversed().joined(separator: " ")
}

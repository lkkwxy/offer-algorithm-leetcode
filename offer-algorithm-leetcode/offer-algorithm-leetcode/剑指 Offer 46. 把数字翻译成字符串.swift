//
//  剑指 Offer 46. 把数字翻译成字符串.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation
/**
 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

  

 示例 1:

 输入: 12258
 输出: 5
 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"
//  1 2258 = 2 258 + 22 58 = 2 2 58 + 2 25 8 + 22 58
 // 12 258 = 12 25 8
 

 提示：

 0 <= num < 231


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


func translateNum(_ num: Int) -> Int {
    var resultMap = [Int: Int]()
    return translateString("\(num)".utf8CString.dropLast(), startIndex: 0, resultMap: &resultMap)
}

func translateString(_ nums: [CChar], startIndex: Int, resultMap: inout [Int: Int]) -> Int {
    if startIndex >= nums.count - 1 {
        return 1
    }
    if let result = resultMap[startIndex] {
        return result
    }
    let cur = nums[startIndex] - 48
    let next = nums[startIndex + 1] - 48
    var result = 0
    if cur == 0 || (cur * 10 + next) > 25 {
        result = translateString(nums, startIndex: startIndex + 1, resultMap: &resultMap)
    } else {
        result = translateString(nums, startIndex: startIndex + 1, resultMap: &resultMap) + translateString(nums, startIndex: startIndex + 2, resultMap: &resultMap)
    }
    resultMap[startIndex] = result
    return result
}

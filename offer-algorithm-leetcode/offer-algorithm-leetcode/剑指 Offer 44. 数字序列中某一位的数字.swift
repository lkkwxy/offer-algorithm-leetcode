//
//  剑指 Offer 44. 数字序列中某一位的数字.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation

/**
 数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，等等。

 请写一个函数，求任意第n位对应的数字。

  

 示例 1：

 输入：n = 3
 输出：3
 示例 2：

 输入：n = 11
 输出：0
  

 限制：

 0 <= n < 2^31


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func findNthDigit(_ n: Int) -> Int {
    if n < 10 {
        return n
    }
    var n = n - 10
    var digit = 10
    var length = 2
    var number = 9 * digit * length
    while n > number {
        n = n - number
        digit *= 10
        length += 1
        number = 9 * digit * length
    }
    let value = "\(n / length + digit)"
    let result = String(value[value.index(value.startIndex, offsetBy: n % length)])
    return Int(result)!
}

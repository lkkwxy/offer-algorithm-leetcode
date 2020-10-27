//
//  剑指 Offer 15. 二进制中1的个数.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/27.
//

import Foundation
/**
 请实现一个函数，输入一个整数，输出该数二进制表示中 1 的个数。例如，把 9 表示成二进制是 1001，有 2 位是 1。因此，如果输入 9，则该函数输出 2。

 示例 1：

 输入：00000000000000000000000000001011
 输出：3
 解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。
 示例 2：

 输入：00000000000000000000000010000000
 输出：1
 解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
 示例 3：

 输入：11111111111111111111111111111101
 输出：31
 解释：输入的二进制串 11111111111111111111111111111101 中，共有 31 位为 '1'。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func hammingWeight(_ n: Int) -> Int {
    var n = n
    while n != 0 {
        result += 1
        n = n & (n - 1)
    }
    return result
}

func hammingWeight1(_ n: Int) -> Int {
    var result = 0
    var n = n
    while n != 0 {
        if n % 2 == 1 {
            result += 1
        }
        n = n >> 1
    }
    return result
}

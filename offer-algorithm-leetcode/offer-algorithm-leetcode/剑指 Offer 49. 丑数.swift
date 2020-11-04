//
//  剑指 Offer 49. 丑数.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/3.
//

import Foundation
/**
 我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

  

 示例:

 输入: n = 10
 输出: 12
 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 说明:

 1 是丑数。
 n 不超过1690。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/chou-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func nthUglyNumber(_ n: Int) -> Int {

    var results = Array(repeating: 1, count: n)

    var i = 0, j = 0, k = 1
    for num in 1..<n {
        let lastUglyNumber = results[num - 1]
        let num1 = results[i] * 2
        let num2 = results[j] * 3
        let num3 = results[k] * 5
        results[num] = min(min(max(num1, lastUglyNumber), max(num2, lastUglyNumber)), max(num3, lastUglyNumber))
        if results[num] == num1 {
            i += 1
        }
        if results[num] == num2 {
            j += 1
        }
        if results[num] == num3 {
            k += 1
        }
    }
    return results[n - 1]
}

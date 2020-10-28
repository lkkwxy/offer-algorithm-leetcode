//
//  剑指 Offer 16. 数值的整数次方.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/28.
//

import Foundation
/**
 实现函数double Power(double base, int exponent)，求base的exponent次方。不得使用库函数，同时不需要考虑大数问题。

  

 示例 1:

 输入: 2.00000, 10
 输出: 1024.00000
 示例 2:

 输入: 2.10000, 3
 输出: 9.26100
 示例 3:

 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zhi-de-zheng-shu-ci-fang-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    } else if n < 0 {
        return 1 / myPow(x, n * -1)
    }
    if n % 2 == 0 {
        return myPow(x * x, n / 2)
    }
    return x * myPow(x * x, n / 2)
}

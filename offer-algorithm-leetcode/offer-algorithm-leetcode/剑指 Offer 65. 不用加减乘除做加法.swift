//
//  剑指 Offer 65. 不用加减乘除做加法.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/8.
//

import Foundation
/**
 写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。

  

 示例:

 输入: a = 1, b = 1
 输出: 2
  

 提示：

 a, b 均可能是负数或 0
 结果不会溢出 32 位整数

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/bu-yong-jia-jian-cheng-chu-zuo-jia-fa-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func add(_ a: Int, _ b: Int) -> Int {
    var num1 = a
    var num2 = b
    while num2 != 0 {
        let tmp = num1 ^ num2
        num2 = (num1 & num2) << 1
        num1 = tmp
    }
    return num1
}

//
//  剑指 Offer 43. 1～n 整数中 1 出现的次数.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation
/**
 输入一个整数 n ，求1～n这n个整数的十进制表示中1出现的次数。

 例如，输入12，1～12这些整数中包含1 的数字有1、10、11和12，1一共出现了5次。

  

 示例 1：

 输入：n = 12
 输出：5
 示例 2：

 输入：n = 13
 输出：6
  

 限制：

 1 <= n < 2^31

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/1nzheng-shu-zhong-1chu-xian-de-ci-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func countDigitOne(_ n: Int) -> Int {
    var digit = 1
    var result = 0
    while n / digit != 0 {
        let tmpNumber = n / digit / 10
        let cur = n / digit % 10
        if cur == 0 {
            result += tmpNumber * digit
        } else if cur == 1 {
            result += tmpNumber * digit + n % digit + 1
        } else {
            result += (tmpNumber + 1) * digit
        }
        digit *= 10
    }
    return result
}

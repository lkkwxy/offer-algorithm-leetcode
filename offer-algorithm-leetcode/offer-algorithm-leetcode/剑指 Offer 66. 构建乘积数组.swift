//
//  剑指 Offer 66. 构建乘积数组.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/8.
//

import Foundation
/**
 给定一个数组 A[0,1,…,n-1]，请构建一个数组 B[0,1,…,n-1]，其中 B 中的元素 B[i]=A[0]×A[1]×…×A[i-1]×A[i+1]×…×A[n-1]。不能使用除法。

  

 示例:

 输入: [1,2,3,4,5]
 输出: [120,60,40,30,24]
  

 提示：

 所有元素乘积之和不会溢出 32 位整数
 a.length <= 100000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/gou-jian-cheng-ji-shu-zu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func constructArr(_ a: [Int]) -> [Int] {
    guard a.count > 1 else {
        return a
    }
    var c = Array(repeating: 1, count: a.count)
    var d = Array(repeating: 1, count: a.count)
    for i in 1..<a.count {
        c[i] = a[i - 1] * c[i - 1]
    }
    for i in stride(from: a.count - 2, to: -1, by: -1) {
        d[i] = d[i + 1] * a[i + 1]
    }
    var result = Array(repeating: 1, count: a.count)
    for i in 0..<a.count {
        result[i] = c[i] * d[i]
    }
    return result
}

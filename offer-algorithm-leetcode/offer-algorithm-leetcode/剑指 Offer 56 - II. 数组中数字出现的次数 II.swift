//
//  剑指 Offer 56 - II. 数组中数字出现的次数 II.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/5.
//

import Foundation
/**
 在一个数组 nums 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。

  

 示例 1：

 输入：nums = [3,4,3,3]
 输出：4
 示例 2：

 输入：nums = [9,1,7,9,7,9,7]
 输出：1
  

 限制：

 1 <= nums.length <= 10000
 1 <= nums[i] < 2^31
  

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
// 0011
// 0100
func singleNumber(_ nums: [Int]) -> Int {
    var bits = Array(repeating: 0, count: 32)
    var mask = 1
    for i in 0..<32 {
        var count = 0
        for num in nums {
            if num & mask != 0 {
                count += 1
            }
        }
        mask = mask << 1
        bits[i] = count
    }
    var result = 0
    mask = 1
    for bit in bits where bit % 3 != 0 {
        result = result | mask
        mask = mask << 1
    }
    return result
}

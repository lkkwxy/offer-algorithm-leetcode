//
//  剑指 Offer 51. 数组中的逆序对.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/4.
//

import Foundation
/**
 在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

  

 示例 1:

 输入: [7,5,6,4]
 输出: 5
  

 限制：

 0 <= 数组长度 <= 50000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shu-zu-zhong-de-ni-xu-dui-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
// 4
// 1,3,5,17 2,4,6,8

//

func reversePairs(_ nums: [Int]) -> Int {
    var nums = nums
    var tmp = nums
    let count = mergeSort(&nums, &tmp, 0, nums.count - 1)
    return count
}

func mergeSort(_ nums: inout [Int], _ tmp: inout [Int], _ left: Int, _ right: Int) -> Int{
    if left < right {
        let mid =  (right - left) / 2 + left
        var count = mergeSort(&nums, &tmp, left, mid) + mergeSort(&nums, &tmp, mid + 1, right)
        var i = left
        var j = mid + 1
        var k = left
        while i <= mid, j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i]
                i += 1
                count += (j - mid - 1)
            } else {
                tmp[k] = nums[j]
                j += 1
            }
            k += 1
        }
        if i <= mid {
            count += (right - mid) * (mid - i + 1)
            tmp[k...right] = nums[i...mid]
        } else if j <= right {
            tmp[k...right] = nums[j...right]
        }
        for i in left...right {
            nums[i] = tmp[i]
        }
        return count
    }
    return 0
}

/// O(n^2)超出时间限制
func reversePairs1(_ nums: [Int]) -> Int {
    guard nums.count >= 2 else {
        return 0
    }
    var count = 0
    for i in 0..<nums.count - 1 {
        for j in i+1..<nums.count {
            if nums[i] > nums[j] {
                count += 1
            }
        }
    }
    return count
}

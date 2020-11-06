//
//  剑指 Offer 59 - I. 滑动窗口的最大值.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/6.
//

import Foundation
/**
 给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 提示：

 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/hua-dong-chuang-kou-de-zui-da-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    guard k > 1 else {
        return nums
    }
    var results = [Int]()
    var indexs = [0]
    for i in 1..<k-1 {
        if nums[i] >= nums[indexs[0]] {
            indexs = [i]
        } else {
            for j in 1..<indexs.count {
                if nums[i] >= nums[indexs[j]] {
                    indexs[j...] = []
                    break
                }
            }
            indexs.append(i)
        }
    }
    var i = 0
    var j = k - 1
    while j < nums.count {
        results.append(max(nums[j], nums[indexs[i]]))
        if nums[j] >= nums[indexs[i]] {
            indexs = [j]
            i = 0
        } else {
            for k in i + 1..<indexs.count {
                if nums[j] >= nums[indexs[k]] {
                    indexs[k...] = []
                    break
                }
            }
            indexs.append(j)
        }
        j += 1
        if j - k + 1 > indexs[i] {
            i += 1
        }
    }
    return results
}

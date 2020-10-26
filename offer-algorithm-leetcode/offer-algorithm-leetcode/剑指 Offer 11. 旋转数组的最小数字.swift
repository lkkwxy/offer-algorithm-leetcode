//
//  剑指 Offer 11. 旋转数组的最小数字.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/26.
//

import Foundation
/**
 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。
 
 示例 1：
 
 输入：[3,4,5,1,2]
 输出：1
 示例 2：
 
 输入：[2,2,2,0,1]
 输出：0
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func minArray(_ numbers: [Int]) -> Int {
    if numbers.isEmpty {
        return -1
    }
    if numbers.count == 1 {
        return numbers[0]
    }
    var currentIndex = (numbers.count - 1) / 2
    var endIndex = numbers.count - 1
    var startIndex = 0
    if numbers[endIndex] > numbers[startIndex] {
        return numbers[startIndex]
    }
    while startIndex < endIndex {
        if numbers[currentIndex] > numbers[currentIndex + 1] {
            return numbers[currentIndex + 1]
        } else if numbers[currentIndex] > numbers[endIndex] {
            startIndex = currentIndex + 1
        } else if numbers[currentIndex] < numbers[endIndex] {
            endIndex = currentIndex
        } else {
            endIndex -= 1
        }
        currentIndex = (startIndex + endIndex) / 2
    }
    return numbers[currentIndex]
}

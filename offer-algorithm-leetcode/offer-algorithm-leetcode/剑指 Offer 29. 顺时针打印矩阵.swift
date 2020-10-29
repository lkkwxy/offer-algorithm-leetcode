//
//  剑指 Offer 29. 顺时针打印矩阵.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/29.
//

import Foundation
/**
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

  

 示例 1：

 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：

 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
  

 限制：

 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shun-shi-zhen-da-yin-ju-zhen-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty {
        return []
    }
    var result = [Int]()
    let m = matrix.count
    let n = matrix[0].count
    var left = 0
    var right = n - 1
    var top = 0
    var bottom = m - 1
    while left <= right && top <= bottom {
        for i in left...right {
            result.append(matrix[top][i])
        }
        if bottom > top {
            for i in top+1...bottom {
                result.append(matrix[i][right])
            }
            if right > left {
                for i in stride(from: right - 1, to: left - 1, by: -1) {
                    result.append(matrix[bottom][i])
                }
            }
        }
        if right > left {
            for i in stride(from: bottom - 1, to: top, by: -1) {
                result.append(matrix[i][left])
            }
        }
        left += 1
        right -= 1
        top += 1
        bottom -= 1
    }
    return result
}

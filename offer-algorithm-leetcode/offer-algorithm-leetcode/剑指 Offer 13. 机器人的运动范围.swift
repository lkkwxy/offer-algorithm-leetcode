//
//  剑指 Offer 13. 机器人的运动范围.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/27.
//

import Foundation
/**
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

  

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 2：

 输入：m = 3, n = 1, k = 0
 输出：1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    return movingCount(&visited, 0, 0, m, n, k)
}
func movingCount(_ visited: inout [[Bool]], _ i: Int, _ j: Int, _ m: Int, _ n: Int, _ k: Int) -> Int {
    if i < 0 || j < 0 || i >= m || j >= n || visited[i][j] {
        return 0
    }
    visited[i][j] = true
    if sumOfDigts(i) + sumOfDigts(j) > k {
        return 0
    }
    return 1 + movingCount(&visited, i + 1, j, m, n, k) +
        movingCount(&visited, i, j + 1, m, n, k) +
        movingCount(&visited, i - 1, j, m, n, k) +
        movingCount(&visited, i, j - 1, m, n, k)
}

func sumOfDigts(_ num: Int) -> Int {
    var num = num
    var sum = 0
    while num != 0 {
        sum += num % 10
        num = num / 10
    }
    return sum
}

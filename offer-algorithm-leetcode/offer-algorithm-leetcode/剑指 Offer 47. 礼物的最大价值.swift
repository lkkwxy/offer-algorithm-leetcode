//
//  剑指 Offer 47. 礼物的最大价值.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/11/3.
//

import Foundation
/**
 
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

  

 示例 1:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
 */
func maxValue(_ grid: [[Int]]) -> Int {
    let m = grid.count
    guard m > 0, let n = grid.first?.count, n > 0 else {
        return 0
    }
    var results = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    for i in stride(from: m - 1, to: -1, by: -1) {
        for j in stride(from: n - 1, to: -1, by: -1) {
            results[i][j] = grid[i][j] + max(results[i + 1][j], results[i][j + 1])
        }
    }
    return results[0][0]
}

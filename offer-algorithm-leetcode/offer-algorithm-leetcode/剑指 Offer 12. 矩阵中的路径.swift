//
//  剑指 Offer 12. 矩阵中的路径.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/26.
//

import Foundation
/**
 请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。
 
 [["a","b","c","e"],
 ["s","f","c","s"],
 ["a","d","e","e"]]
 
 但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。
 
  
 
 示例 1：
 
 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 示例 2：
 
 输入：board = [["a","b"],["c","d"]], word = "abcd"
 输出：false
 提示：
 
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 
 */
func exist(_ board: [[Character]], _ word: String) -> Bool {
    var words = [Character]()
    var board = board
    for w in word {
        words.append(w)
    }
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            var visited = Array(repeating: Array(repeating: false, count: board[i].count), count: board.count)
            if dfs(&visited, &board, words, i: i, j: j, k: 0) {
                return true
            }
        }
    }
    return false
}

private func dfs(_ visited: inout [[Bool]], _ board: inout [[Character]], _ words: [Character], i: Int, j: Int, k: Int) -> Bool {
    if i < 0 || i >= board.count || j < 0 || j >= board[i].count || visited[i][j] == true || words[k] != board[i][j] {
        return false
    }
    if k == words.count - 1 {
        return true
    }
    visited[i][j] = true
    let res = dfs(&visited, &board, words, i: i + 1, j: j, k: k + 1) ||
        dfs(&visited, &board, words, i: i - 1, j: j, k: k + 1) ||
        dfs(&visited, &board, words, i: i, j: j + 1, k: k + 1) ||
        dfs(&visited, &board, words, i: i, j: j - 1, k: k + 1)
    visited[i][j] = false
    return res
}

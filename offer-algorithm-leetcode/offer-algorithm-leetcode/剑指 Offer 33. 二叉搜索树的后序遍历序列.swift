//
//  剑指 Offer 33. 二叉搜索树的后序遍历序列.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/30.
//

import Foundation
/**
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。

  

 参考以下这颗二叉搜索树：

      5
     / \
    2   6
   / \
  1   3
 示例 1：

 输入: [1,6,3,2,5]
 输出: false
 示例 2：

 输入: [1,3,2,7,6,5]
 输出: true
  
1,2,3,5,6,7
 提示：

 数组长度 <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func verifyPostorder(_ postorder: [Int]) -> Bool {
    return verifyPostorder(postorder: postorder, start: 0, end: postorder.count - 1)
}

//[4, 8, 6, 12, 16, 14, 10]
func verifyPostorder(postorder: [Int], start: Int, end: Int) -> Bool {
    if start >= end {
        return true
    }
    let root = postorder[end]
    var i = start
    while i < end {
        if postorder[i] > root {
            break
        }
        i += 1
    }
    var j = i
    while j < end {
        if postorder[j] < root {
            break
        }
        j += 1
    }
    if j != end {
        return false
    }
    
    return verifyPostorder(postorder: postorder, start: start, end: i - 1) && verifyPostorder(postorder: postorder, start: i, end: end - 1)
}

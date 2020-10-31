//
//  剑指 Offer 34. 二叉树中和为某一值的路径.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/31.
//

import Foundation
/**
 输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。

  

 示例:
 给定如下二叉树，以及目标和 sum = 22，

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \    / \
         7    2  5   1
 返回:

 [
    [5,4,11,2],
    [5,8,4,5]
 ]
  

 提示：

 节点总数 <= 10000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var paths = [[Int]]()
    var path = [Int]()
    pathSum(root, sum, &paths, &path)
    return paths
}

func pathSum(_ root: TreeNode?, _ sum: Int, _ paths:inout [[Int]], _ path:inout [Int]) {
    guard let root = root else {
        return
    }
    path.append(root.val)
    let target = sum - root.val
    if target == 0 && root.left == nil && root.right == nil {
        paths.append(path)
    }
    pathSum(root.left, target, &paths, &path)
    pathSum(root.right, target, &paths, &path)
    path.removeLast()
}

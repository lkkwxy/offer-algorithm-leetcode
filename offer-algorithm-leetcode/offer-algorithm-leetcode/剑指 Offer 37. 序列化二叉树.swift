//
//  剑指 Offer 37. 序列化二叉树.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/10/31.
//

import Foundation
/**
 请实现两个函数，分别用来序列化和反序列化二叉树。

 示例:

 你可以将以下二叉树：

     1
    / \
   2   3
      / \
     4   5

 序列化为 "[1,2,3,null,null,4,5]"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/xu-lie-hua-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/// js的实现，由于本题leetCode不支持Swift，用js进行验证

/**
 var serialize = function(root) {
     if(!root) {
         return "[]"
     }
     var stack = [root]
     var result = "["
     while (stack.length > 0) {
         var tmp = []
         for(idx in stack) {
             let item = stack[idx]
             if (item == "null,") {
                 result += "null,"
             } else {
                 result += item.val + ","
                 if(item.left) {
                     tmp.push(item.left)
                 } else {
                     tmp.push("null,")
                 }
                 if(item.right) {
                     tmp.push(item.right)
                 } else {
                     tmp.push("null,")
                 }
             }
         }
         stack = tmp
     }

     result = result.substr(0, result.length - 1)
     while(result.endsWith(",null")) {
         result = result.substr(0, result.length - 5)
     }
     return result + "]"
 };

 var deserialize = function(data) {
     let array = JSON.parse(data)
     if (array.length == 0 || array[0] == null) {
         return null
     }
     
     var result = new TreeNode(array[0])
     var stack = [result]
     var count = array.length
     for(var i = 1; i < count;) {
         var tmp = []
         for (var j = 0; j < stack.length; j++) {
             let node = stack[j]
             if (i < count && array[i] != null) {
                 let leftNode = new TreeNode(array[i])
                 node.left = leftNode
                 tmp.push(leftNode)
             }
             i++
             if (i < count && array[i] != null) {
                 let rightNode = new TreeNode(array[i])
                 node.right = rightNode
                 tmp.push(rightNode)
             }
             i++
         }

         stack = tmp
     }
     return result
 };
 */

func deserialize(_ string: String) -> TreeNode? {
    guard let data = string.data(using: .utf8),
          let array = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any],
          !array.isEmpty,
          let val = array[0] as? Int64 else {
        return nil
    }
    let root = TreeNode(Int(val))
    var stack = [root]
    let count = array.count
    var i = 1
    while i < count {
        var tmp = [TreeNode]()
        for item in stack {
            if i < array.count, let val = array[i] as? Int64 {
                let leftNode = TreeNode(Int(val))
                tmp.append(leftNode)
                item.left = leftNode
            }
            i += 1
            if i < array.count, let val = array[i] as? Int64 {
                let rightNode = TreeNode(Int(val))
                tmp.append(rightNode)
                item.right = rightNode
            }
            i += 1
        }
        stack = tmp
    }

    return root
}

func serialize(_ root: TreeNode?)  -> String {
    guard let root = root else {
        return "[]"
    }
    var stack = [root]
    var result = ["\(root.val)"]
    while !stack.isEmpty {
        var tmp = [TreeNode]()
        for item in stack {
            if let left = item.left {
                tmp.append(left)
                result.append("\(left.val)")
            } else {
                result.append("null")
            }
            if let right = item.right {
                tmp.append(right)
                result.append("\(right.val)")
            } else {
                result.append("null")
            }
        }
        stack = tmp
    }
    while true {
        if let last = result.last, last == "null" {
            let _ = result.popLast()
        } else {
            break
        }
    }
    return "[" + result.joined(separator: ",") + "]"
}

func testSerializeTreeNode() {
    let node1 = TreeNode(1)
    node1.left = TreeNode(2)
    let node2 = TreeNode(3)
    node1.right = node2
    node2.left = TreeNode(4)
    node2.right = TreeNode(5)
    assert(serialize(node1) == "[1,2,3,null,null,4,5]")
    let node3 = deserialize(serialize(node1))
    assert(node3 == node1)
    
    let node4 = TreeNode(-1, TreeNode(0), TreeNode(1))
    assert(serialize(node4) == "[-1,0,1]")
    assert(deserialize(serialize(node4)) == node4)
}

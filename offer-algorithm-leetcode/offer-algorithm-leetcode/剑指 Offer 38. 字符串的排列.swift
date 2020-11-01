//
//  剑指 Offer 38. 字符串的排列.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤坤 on 2020/11/1.
//

import Foundation
/**
 输入一个字符串，打印出该字符串中字符的所有排列。

  

 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

  

 示例:

 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]
  

 限制：

 1 <= s 的长度 <= 8



 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
func permutation(_ s: String) -> [String] {
    guard !s.isEmpty else {
        return []
    }
    var array = [String.Element]()
    for item in s {
        array.append(item)
    }
    
    var result: Set<String> = [String(array[0])]
    var i = 1
    while i < array.count {
        var tmp = [String]()
        for item in result {
            for j in 0..<item.count {
                var str = item
                str.insert(array[i], at: str.index(str.startIndex, offsetBy: j))
                tmp.append(str)
            }
            tmp.append(item + String(array[i]))
        }
        result = []
        tmp.forEach({ (item) in
            result.insert(item)
        })
        i += 1
    }
    return Array(result)
}

func permutation1(_ s: String) -> [String] {
    var result = [String]()
    var s = s
    permutationDFS(&s, index: 0, &result)
    return result
}

func permutationDFS(_ s: inout String, index: Int, _ results: inout [String]) {
    if index == s.count - 1 {
        results.append(s)
        return
    }
    var set = Set<Character>()
    let startIndex = s.startIndex
    for i in index..<s.count {
        let currentIndex = s.index(startIndex, offsetBy: i)
        if set.contains(s[currentIndex]) {
            continue
        }
        set.insert(s[currentIndex])
        let indexIndex = s.index(startIndex, offsetBy: index)
        swap(&s, indexIndex, currentIndex)
        permutationDFS(&s, index: index + 1, &results)
        swap(&s, indexIndex, currentIndex)
    }
}

func swap(_ s: inout String, _ index1: String.Index, _ index2: String.Index) {
    if index2 == index1 {
        return
    }
    var minIndex = index1
    var maxIndex = index2
    if index2 < index1 {
        minIndex = index2
        maxIndex = index1
    }
    s.insert(s.remove(at: maxIndex), at: minIndex)
    s.insert(s.remove(at: s.index(after: minIndex)), at: maxIndex)
}

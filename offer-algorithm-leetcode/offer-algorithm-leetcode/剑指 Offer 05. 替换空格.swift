//
//  剑指 Offer 05. 替换空格.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/10.
//

import Foundation
/**
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

  

 示例 1：

 输入：s = "We are happy."
 输出："We%20are%20happy."

 */
func replaceSpace(_ s: String) -> String {
    var result = ""
    for c in s {
        if c == " " {
            result.append("%20")
        } else {
            result.append(c)
        }
    }
    return result
}

func replaceSpace1(_ s: String) -> String {
    let chars = s.utf8CString
    var count = 0
    for item in chars {
        count += 1
        if item == 32 {
            count += 2
        }
    }
    var tmpChars = [CChar](repeating: 0, count: count)
    var i = 0
    for item in chars {
        if item == 32 {
            tmpChars[i...i + 2] = [37, 50, 48]
            i += 3
        } else {
            tmpChars[i] = item
            i += 1
        }
    }
    return String(utf8String: tmpChars)!
}

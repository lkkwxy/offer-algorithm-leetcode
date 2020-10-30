//
//  剑指 Offer 30. 包含min函数的栈.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/30.
//

import Foundation
/**
 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。

  

 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.min();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.min();   --> 返回 -2.
  

 提示：

 各函数的调用总次数不超过 20000 次


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/bao-han-minhan-shu-de-zhan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class MinStack {
    private var stack = [Int]()
    private var minStack = [Int]()
    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {
        stack.append(x)
        if let last = minStack.last {
            if last >= x {
                minStack.append(x)
            }
        } else {
            minStack.append(x)
        }
    }
    
    func pop() {
        
        if let last = stack.popLast(), let minLast = minStack.last, last == minLast {
            let _ = minStack.popLast()
        }
    }
    
    func top() -> Int {
        return stack.last ?? -1
    }
    
    func min() -> Int {
        return minStack.last ?? -1
    }
}

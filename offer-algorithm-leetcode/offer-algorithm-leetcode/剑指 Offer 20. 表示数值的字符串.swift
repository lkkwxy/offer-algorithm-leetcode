//
//  剑指 Offer 20. 表示数值的字符串.swift
//  offer-algorithm-leetcode
//
//  Created by 李坤 on 2020/10/29.
//

import Foundation
/**
 请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，字符串"+100"、"5e2"、"-123"、"3.1416"、"-1E-16"、"0123"都表示数值，但"12e"、"1a3.14"、"1.2.3"、"+-5"及"12e+5.4"都不是。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
enum NumberState {
    case initial
    case sign
    case e
    case eNumber
    case eSign
    case point
    case pointNumber
    case numberPoint
    case number
    
    func next(item: String.Element) -> Self? {
        switch self {
        case .initial:
            if item == "+" || item == "-" {
                return .sign
            } else if item >= "0" && item <= "9" {
                return .number
            } else if item == "." {
                return .point
            }
        case .sign:
            if item >= "0" && item <= "9" {
                return .number
            } else if item == "." {
                return .point
            }
        case .e:
            if item == "+" || item == "-" {
                return .eSign
            } else if item >= "0" && item <= "9" {
                return .eNumber
            }
        case .eSign, .eNumber:
            if item >= "0" && item <= "9" {
                return .eNumber
            }
        case .point:
            if item >= "0" && item <= "9" {
                return .pointNumber
            }
        case .pointNumber, .numberPoint:
            if item >= "0" && item <= "9" {
                return .pointNumber
            } else if item == "E" || item == "e" {
                return .e
            }
        case .number:
            if item == "." {
                return .numberPoint
            } else if item == "E" || item == "e" {
                return .e
            }else if item >= "0" && item <= "9" {
                return .number
            }
        }
        return nil
    }
    
    func isNumber() -> Bool {
        switch self {
        case .initial, .e, .eSign, .sign, .point:
            return false
        default:
            return true
        }
    }
    
}
func isNumber(_ s: String) -> Bool {
    let notSpacesString = s.trimmingCharacters(in: .whitespaces)
    var numberState = NumberState.initial
    for item in notSpacesString {
        if let state = numberState.next(item: item) {
            numberState = state
        } else {
            return false
        }
    }
    return numberState.isNumber()
}

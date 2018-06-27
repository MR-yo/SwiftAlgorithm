//
//  MathProblem.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/6/4.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation

/**
 * *************** *
 *   数学相关算法题。 *
 * *************** *
 * Line xx:
 * Line xx:
 * Line xx:
 * Line xx:
 */


/**
 * 题目：统计所有小于非负整数 n 的质数的数量。
 * 分析：1.两次遍历妥妥超时
 *      2.第一个优化，求 x 是否为质数，遍历到 根号x 就行
 *      3.最优解：空间换时间，维护一个长度为 n 的数组或者 map，确定一个质数后，将它的倍数都置为 false
 */
func countPrimes(_ n: Int) -> Int {
    guard n > 2 else {
        return 0
    }
    var temp : [Bool] = Array(repeating: true, count: n)
    for i in 2..<n {
        let x = temp[i]
        if x {
            var j = i * 2
            while j < n {
                temp[j] = false
                j += i
            }
        }
    }
    var result = 0
    for b in temp {
        if b {
            result += 1
        }
    }
    return result
}


/**
 * 题目：罗马数字转整数
 * 分析：1.
 */
func romanToInt(_ s: String) -> Int {
    guard s.count > 0 else {
        return 0
    }
    let map : [Character : Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
    var result = 0
    var temp : Character = " "
    for c in s {
        result += map[c]!
        if temp == "I" && (c == "V" || c == "X") ||
           temp == "X" && (c == "L" || c == "C") ||
           temp == "C" && (c == "D" || c == "M") {
            result -= 2 * map[c]!
            temp = " "
        }else {
            temp = c
        }
    }
    return result
}

/**
 * 题目：整数转罗马数字,输入确保在 1 到 3999 的范围内。
 * 分析：1.
 */
func intToRoman(_ num: Int) -> String {

    return ""
}


/**
 * 题目：实现 int sqrt(int x) 函数。计算并返回 x 的平方根，其中 x 是非负整数。由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
 * 分析：1.
 */
func mySqrt(_ x: Int) -> Int {
    guard x >= 0 else {
        return 0
    }
    var t = 0
    while t * t <= x {
        t += 1
    }
    return t - 1
}

/**
 * 题目：给定一个整数 n，返回 n! 结果尾数中零的数量。
 * 分析：1.
 */
func trailingZeroes(_ n: Int) -> Int {
    return n / 15
}











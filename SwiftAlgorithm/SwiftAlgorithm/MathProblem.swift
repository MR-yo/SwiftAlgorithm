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
 * Excel表列序号
 * 给定一个Excel表格中的列名称，返回其相应的列序号。
 */
func titleToNumber(_ s: String) -> Int {
    guard s.count > 0 else {
        return 0
    }
    let sArray = Array(s)
    var result = 0
    for i in 0..<sArray.count {
        let c = sArray[sArray.count - 1 - i]
        let a = Int(c.asciiValue!) - 64
        var value = 1
        for _ in 0..<i {
            value = 26 * value
        }
        result = result + value * a
    }
    return result
}

func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    guard A.count > 0 else {
        return 0
    }
    
    var map1 = [Int: Int]()
    for i in 0..<A.count {
        let a = A[i]
        for j in 0..<B.count {
            let b = B[j]
            let add = a + b
            if map1[add] == nil {
                map1[add] = 1
            } else {
                map1[add] = map1[add]! + 1
            }
        }
    }
    
    var map2 = [Int: Int]()
    for i in 0..<C.count {
        let c = C[i]
        for j in 0..<D.count {
            let d = D[j]
            let add = c + d
            if map2[add] == nil {
                map2[add] = 1
            } else {
                map2[add] = map2[add]! + 1
            }
        }
    }
    
    var result = 0
    for v in map1.keys {
        if map2[0 - v] != nil {
            result = result + map1[v]! * map2[0 - v]!
        }
    }
    
    return result
}

func isUgly(_ num: Int) -> Bool {
    if num == 1 {
        return true
    }
    var temp = num
    while temp % 2 == 0 {
        temp = temp / 2
    }
    while temp % 3 == 0 {
        temp = temp / 3
    }
    while temp % 5 == 0 {
        temp = temp / 5
    }
    return temp == 1
}

func isPowerOfFour(_ num: Int) -> Bool {
    guard num > 0 else {
        return false
    }
    let x = log2(Double(num))
    if x - Double(Int(x)) > 0 {
        return false
    }
    return Int(x) % 2 == 0
}

func readBinaryWatch(_ num: Int) -> [String] {
    guard num <= 10 else {
        return []
    }
    if num == 0 {
        return ["0:00"]
    }
    var map = [Int: Int]()
    for i in 0...59 {
        var count = 0
        var temp = i
        while temp > 0 {
            if temp % 2 != 0 {
                count += 1
            }
            temp = temp / 2
        }
        map[i] = count
    }
    var result = [String]()
    for i in 0...11 {
        let m = map[i]!
        for j in 0...59 {
            let n = map[j]!
            if m + n == num {
                let time = String(format: "%01d:%02d", i, j)
                result.append(time)
            }
        }
    }
    return result
}

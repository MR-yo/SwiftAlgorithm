//
//  StringProblem.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/5/25.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation


/**
 * **************** *
 *   字符串相关算法题  *
 * **************** *
 * Line xx:
 * Line xx:
 * Line xx:
 * Line xx:
 */


/**
 * 题目：反转字符串
 * 分析：1.新创建一个数组？
 *      2.调系统 api
 */
func reverseString1(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    var temp : [Character] = []
    for c in s {
        temp.append(c)
    }
    var ns = ""
    for i in 0..<temp.count {
        ns = ns + String(temp[temp.count - 1 - i])
    }
    return ns
}

func reverseString2(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    return String(s.reversed())
}

/**
 * 题目：反转字符串
 * 分析：1.新创建一个数组？
 *      2.调系统 api
 */


















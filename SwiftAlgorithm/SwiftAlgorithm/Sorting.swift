//
//  Sorting.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/5/11.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation

/**
 * **************** *
 *   排序相关算法题。  *
 * **************** *
 * Line xx:
 * Line xx:
 * Line xx:
 * Line xx:
 */

/**
 * 题目：第一个错误的版本
 * 分析：1. [F,F,F,F,F,F,F,T,T,T,T,T,T,T] 求第一个 T 的下标
 */
func firstWrongVersion(n:Int) -> Int {
    var first = 1
    var last = n
    
    while first < last {
        
        // 注意！ 这里可能会超出 int 最大值
        let x = (first + last) / 2
        if isBadVersion(n: x) {
            last = x
        } else {
            first = x + 1
        }
    }
    
    return first
}

func isBadVersion(n:Int) -> Bool {
    //                     0     1     2     3     4     5     6    7    8    9    10   11
    let array : [Bool] = [false,false,false,false,false,false,true,true,true,true,true,true]
    return array[n]
}












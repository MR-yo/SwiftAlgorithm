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
 * 题目：选择排序
 * 分析：
 */
func choseSorting(nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
        return []
    }
    var temp = nums
    var result = [Int]()
    while temp.count != 0 {
        var m = temp.first!
        var mi = 0
        for i in 0..<temp.count {
            if m > temp[i] {
                m = temp[i]
                mi = i
            }
        }
        result.append(m)
        temp.remove(at: mi)
    }
    return result
}

/**
 * 题目：插入排序
 * 分析：
 */
func insertSorting(nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
        return []
    }
    var temp = nums
    var result = [Int]()
    
    result.append(nums.first!)
    temp.removeFirst()
    
    while temp.count != 0 {
        let n = temp.first!
        for i in 0..<result.count{
            if n < result[i] {
                result.insert(n, at: i)
                break
            }
            result.append(n)
        }
        temp.removeFirst()
    }
    return result
}

/**
 * 题目：冒泡排序
 * 分析：
 */
func bubbleSorting(nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
        return []
    }
    var temp = nums
    var i = temp.count - 1
    while i != 0 {
        for j in 0..<i {
            if temp[j] > temp[j + 1]{
                let t = temp[j]
                temp[j] = temp[j + 1]
                temp[j + 1] = t
            }
        }
        i -= 1
    }
    return temp
}



/**
 * 题目：第一个错误的版本
 * 说明：[F,F,F,F,F,F,F,T,T,T,T,T,T,T] 求第一个 T 的下标
 * 分析：二分查找，注意大数情况
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


/**
 * 题目：给定两个大小为 m 和 n 的有序数组 nums1 和 nums2 。请找出这两个有序数组的中位数。要求算法的时间复杂度为 O(log (m+n))
 * 说明：nums1 = [1, 2] nums2 = [3, 4]  中位数是 (2 + 3)/2 = 2.5
 * 分析：好像遍历一遍就可以解决
 */
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    if nums1.count == 0 && nums2.count == 0 {
        return 0
    }
    let target = (nums1.count + nums2.count) / 2
    let isEven = (nums1.count + nums2.count) % 2 == 0
    var i = 0
    var j = 0
    var temp = [Int]()
    while i < nums1.count || j < nums2.count {
        var n : Int
        if i < nums1.count && j < nums2.count {
            let x = nums1[i]
            let y = nums2[j]
            if x < y {
                n = x
                i += 1
            }else {
                n = y
                j += 1
            }
        }else if i < nums1.count {
            n = nums1[i]
            i += 1
        }else {
            n = nums2[j]
            j += 1
        }
        temp.append(n)
        if temp.count - 1 == target {
            if isEven {
                return Double(temp.last! + temp[temp.count - 2]) * 0.5
            }else{
                return Double(n)
            }
        }
    }
    return 0
}









//
//  ArrayProblem.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/5/25.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation

/**
 * **************** *
 *   数组相关算法题。  *
 * **************** *
 * Line xx:
 * Line xx:
 * Line xx:
 * Line xx:
 */


/**
 * 题目：给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
 * 分析：1. 是否可以借助一个新数组
 *      2. 不能的话该怎么处理
 */
func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var temp = nums[0]
    var newArray : [Int] = [temp]
    for i in 1..<nums.count{
        let n = nums[i]
        if temp != n {
            temp = n
            newArray.append(temp)
        }
    }
    nums = newArray
    return nums.count
}

/**
 * 题目：买卖股票的最佳时机,给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。设计一个算法来计算你所能获取的最大利润。
 * 分析：1.
 */
func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else {
        return 0
    }
    
    var result = 0
    var temp = prices[0]
    for i in 1..<prices.count{
        let p = prices[i]
        if p - temp > 0 {
            result += p - temp
        }else{
            temp = p
        }
    }
    return result
}


/**
 * 题目：旋转数组
 * 分析：1.注意 k 可以大于数组长度
 */
func rotate1(_ nums: inout [Int], _ k: Int) -> Void{
    guard nums.count > 1, k >= 0 else {
        return
    }
    let k1 = k % nums.count
    var temp : [Int] = []
    for i in (nums.count - k1)..<nums.count {
        let n = nums[i]
        temp.append(n)
    }
    for i in 0..<(nums.count - k1) {
        let n = nums[i]
        temp.append(n)
    }
    nums = temp
}

func rotate2(_ nums: inout [Int], _ k: Int) -> Void{
    guard nums.count > 1, k >= 0 else {
        return
    }
    var result: [Int] = [Int](repeating: 0, count: nums.count)
    for i in 0 ..< nums.count {
        result[(i + k) % nums.count] = nums[i]
    }
    nums = result
}

/**
 * 题目：给定一个整数数组，判断是否存在重复元素。
 * 分析：1.遍历肯定会超时 ✘
 */
func containsDuplicate(_ nums: [Int]) -> Bool {
    guard nums.count > 1 else {
        return false
    }
    let set = Set(nums)
    return set.count != nums.count
}

/**
 * 题目：给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素
 * 分析：1.遍历肯定会超时 ✘
 */
func singleNumber(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return nums[0]
    }
    var temp = [Int : Int]()
    for i in nums {
        let x = temp[i]
        if x != nil {
            temp[i] = x! + 1
        }else{
            temp[i] = 0
        }
    }
    for (key,value) in temp {
        if value == 0 {
            return key
        }
    }
    return 0
}


/**
 * 题目：给定两个数组，写一个方法来计算它们的交集。
 * 分析：1.遍历肯定会超时 ✘
 */
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    guard nums1.count > 0, nums2.count > 0 else {
        return []
    }
    let tempMin = nums1.count > nums2.count ? nums2 : nums1
    var tempMax = nums1.count > nums2.count ? nums1 : nums2
    var temp : [Int] = []
    
    for i in tempMin {
        for index in 0..<tempMax.count {
            let j = tempMax[index]
            if i ^ j == 0 {
                temp.append(i)
                tempMax.remove(at: index)
                break
            }
        }
    }
    
    return temp
}















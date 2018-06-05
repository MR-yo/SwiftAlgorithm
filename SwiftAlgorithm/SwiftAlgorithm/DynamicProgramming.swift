//
//  DynamicProgramming.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/6/1.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation


/**
 * ****************** *
 *   动态规划相关算法题。 *
 * ****************** *
 * Line xx:
 * Line xx:
 * Line xx:
 * Line xx:
 */


/**
 * 题目：假设你正在爬楼梯。需要 n 步你才能到达楼顶。每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 * 分析：1.本质就是 fobinacci 数列求解
 */
func climbStairs(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    var temp = Array(repeating: 1, count: n + 1)
    for i in 2...n {
        temp[i] = temp[i - 1] + temp[i - 2];
    }
    return temp[n]
}


/**
 * 题目：给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
 * 分析：1.
 */
func maxProfit2(_ prices: [Int]) -> Int {
    guard prices.count > 1 else {
        return 0
    }
    var result = 0
    var p = prices[0]
    for i in 1..<prices.count {
        result = max(prices[i] - p,result)
        p = min(prices[i],p)
    }
    return result
}

/**
 * 题目：给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 * 分析：1.[-2,1,-3,4,-1,2,1,-5,4] 连续子数组 [4,-1,2,1] 的和最大，为 6。
 */
func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    guard nums.count > 1 else {
        return nums[0]
    }
    var temp = nums[0]
    var result = 0
    for i in 1..<nums.count {
        temp = max(nums[i], temp + nums[i])
        result = max(temp,result)
    }
    return result
}

/**
 * 题目：打家劫舍，给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。所取的数值不能相邻
 * 分析：1.[2,1,2,3,2] -> 2 + 2 + 2 = 6, 很容易写出 2 + 3 = 5 的错误答案
 *      2.两个数相等的时候取哪个？ [2,2,3]
 */
func rob(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    guard nums.count > 1 else {
        return nums[0]
    }
    
    var result : [Int] = [nums[0],max(nums[0],nums[1])]
    for i in 2..<nums.count {
        result.append(max(nums[i] + result[i - 2], result[i - 1]))
    }
    
    return result.last!
}








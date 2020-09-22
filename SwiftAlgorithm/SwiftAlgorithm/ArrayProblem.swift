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
 * 分析：1.遍历做 后一个元素减前一个元素 操作，若为正就将差值叠加，若为负就保存旧差值，再从新开始获取差值
 */
func maxProfit1(_ prices: [Int]) -> Int {
    guard prices.count > 1 else {
        return 0
    }
    var temp : [Int] = []
    for i in 0..<prices.count - 1 {
        let x = prices[i + 1] - prices[i]
        if x > 0 {
            temp.append(x)
        }
    }
    var result = 0
    for i in temp {
        result = result + i
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
    for (key,val) in temp {
        if val == 0 {
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

/**
 * 题目：给定一个非负整数组成的非空数组，在该数的基础上加一，返回一个新的数组。
 * 分析：1.考虑到进位就行
 */
func plusOne(_ digits: [Int]) -> [Int] {
    guard digits.count > 0 else {
        return []
    }
    var temp = digits
    for i in 0..<temp.count {
        let index = temp.count - 1 - i
        let last = temp[index]
        if last == 9 {
            temp.remove(at: index)
            temp.insert(0, at: index)
        }else{
            temp.remove(at: index)
            temp.insert(last + 1, at: index)
            return temp
        }
    }
    if temp.first == 0 {
        temp.insert(1, at: 0)
    }
    return temp
}


/**
 * 题目：给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 * 分析：1.如果不借助一个额外的数组该怎么写
 */
func moveZeroes(_ nums: inout [Int]) -> Void {
    guard nums.count > 0 else {
        return
    }
    var temp : [Int] = []
    for i in 0..<nums.count {
        if nums[i] == 0 {
            temp.append(i)
        }
    }
    for i in 0..<temp.count {
        let index = temp[i] - i
        nums.remove(at: index)
        nums.append(0)
    }
}

/**
 * 题目：给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
 * 分析：1.循环两次太弱鸡了，居然也通过了，我以为妥妥超时
 *      2.利用 map
 */
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else {
        return nums
    }
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if nums[i] + nums[j] == target && i != j{
                return [i,j]
            }
        }
    }
    return nums
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else {
        return nums
    }
    var map = [Int : Int]()
    for i in 0..<nums.count {
        let n = nums[i]
        if map[n] == nil {
            map[n] = 0
            map[target - n] = 1
        }else if map[n] == 1{
            return [nums.index(of: target - n)!,i]
        }
    }
    return []
}


/**
 * 题目：判断一个 9x9 的数独是否有效
 * 分析：1.我写的有点蠢...还好通过了..
 *      2.时间居然还排在中等，可能是一碰到错误情况就直接返回的原因吧
 */
func isValidSudoku(_ board: [[Character]]) -> Bool {
    guard board.count == 9 else {
        return false
    }
    var result = false
    
    // 每一行
    for i in 0..<board.count {
        let array = board[i]
        print(array)
        result = hasDuplicateCharacter(array: array)
        if result == true {
            return !result
        }
    }
    print("------------")
    var temp : [Character] = []
    
    // 每一列
    for i in 0..<9 {
        for j in 0..<9 {
            let array = board[j]
            temp.append(array[i])
        }
        print(temp)
        result = hasDuplicateCharacter(array: temp)
        if result == true {
            return !result
        }
        temp.removeAll()
    }
    print("-----------")
    // 每个子块
    let rangeArray : [CountableRange<Int>] = [0..<3,3..<6,6..<9]
    for range1 in rangeArray {
        for range2 in rangeArray {
            for i in range1 {
                let array = board[i]
                let s = array[range2]
                temp = temp + s
            }
            print(temp)
            result = hasDuplicateCharacter(array: temp)
            if result == true {
                return !result
            }
            temp.removeAll()
        }
    }
    
    return result
}

func hasDuplicateCharacter(array:[Character]) -> Bool {
    guard array.count == 9 else {
        return false
    }
    var map : [Character : Int] = ["1":0,"2":0,"3":0,"4":0,"5":0,"6":0,"7":0,"8":0,"9":0]
    for c in array {
        if c == "." {
            continue
        }else{
            if map[c] == 0 {
                map[c] = 1
            }else{
                return true
            }
        }
    }
    return false
}

/**
 * 题目：给定一个 n × n 的二维矩阵表示一个图像。将图像顺时针旋转 90 度。
 * 分析：1.如果不能借助新的数组该怎么处理
 */
func rotate3(_ matrix: inout [[Int]]) {
    guard matrix.count > 0 else {
        return
    }
    var temp : [[Int]] = []
    for i in 0..<matrix.count {
        var newArray : [Int] = []
        for j in 0..<matrix.count {
            let array = matrix[matrix.count - 1 - j]
            newArray.append(array[i])
        }
        temp.append(newArray)
    }
    matrix = temp
}


/**
 * 题目：给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 * 说明：1. 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 *      2. 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 */
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> Void {
    if m == 0 {
        nums1 = nums1 + nums2
        return
    }
    if n == 0 {
        return
    }
    var i = 0
    var j = 0
    var temp = [Int]()
    while i <= m - 1 && j <= n - 1 {
        if nums1[i] < nums2[j] {
            temp.append(nums1[i])
            i = i + 1
        }else{
            temp.append(nums2[j])
            j = j + 1
        }
    }
    if i == m {
        temp = temp + nums2[j..<n]
    }else {
        temp = temp + nums1[i..<m]
    }
    nums1 = temp
}


/**
 * 题目：给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 * 说明：1.[-1, 0, 1, 2, -1, -4]  =>  [[-1, 0, 1],[-1, -1, 2]] ,结果不能重复
 * 分析：1.不能重复的话可以先全部找出来,再用 set 去重,但是 swift set 里不能放数组
 *      2.当然也可以在找的过程中直接去重，但是我感觉可能有点麻烦
 *      3.两次遍历很有可能超时，如何优化(果然超时了)
 *      4.当nums 大部分为0 时，很多都是无效遍历
 */
func threeSum1(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else {
        return []
    }
    var map = [Int : Int]()
    for i in 0..<nums.count {
        map[nums[i]] = (map[nums[i]] ?? 0) + 1;
    }
    var result = [[Int]]()
    var temp = nums.sorted()
    var lastA = temp[0] + 1
    var lastB = temp[1] + 1
    
    for i in 0..<temp.count - 1 {
        let a = temp[i]
        if a == lastA {
            continue
        }else{
            lastA = a
        }
        for j in (i + 1)..<temp.count{
            let b = temp[j]
            if b == lastB {
                continue
            }else{
                lastB = b
            }
            let c = 0 - a - b
            if c > b {
                // 可能存在解
                if map[c] != nil && map[c]! >= 1 {
                    result.append([a,b,c])
                }
            }else if c == b {
                // 可能存在解
                if a == b {
                    if map[c]! > 2 {
                        result.append([a,b,c])
                    }
                }else {
                    if map[c]! > 1{
                        result.append([a,b,c])
                    }
                }
            }else{
                // 往后都不存在解
                break
            }
        }
    }
    return result
}

func threeSum2(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else {
        return []
    }
    
    var map = [Int : Int]()
    for i in 0..<nums.count {
        map[nums[i]] = (map[nums[i]] ?? 0) + 1;
    }
    var temp = nums.sorted()
    var result = [[Int]]()

    for i in 0..<temp.count - 2 {
        if temp[i] > 0 {
            break
        }
        if i > 0 && temp[i] == temp[i - 1] {
            continue
        }
        let a = temp[i]
        for j in (i + 1)..<temp.count - 1{
            if j > i + 1 && temp[j] == temp[j - 1] {
                continue
            }
            let b = temp[j]
            let c = 0 - a - b
            if c > b {
                if map[c] != nil && map[c]! >= 1{
                    result.append([a,b,c])
                }
            }else if c == b {
                if a == b && map[c]! > 2 {
                    result.append([a,b,c])
                }
                if a != b && map[c]! > 1{
                    result.append([a,b,c])
                }
            }else{
                break
            }
        }
    }
    return result
}


/**
 * 题目：给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
 * 分析：1.
 */
func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else {
        return []
    }
    
    var temp = [[1]]
    for i in 1..<numRows {
        let last = temp[i - 1]
        var arr = [Int]()
        for j in 0...i {
            var n : Int
            if j == 0 {
                n = 1
            }else if j == i {
                n = last[j - 1]
            }else {
                n = last[j] + last[j - 1]
            }
            arr.append(n)
        }
        temp.append(arr)
    }
    
    return temp
}

/**
 * 题目：给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
 * 分析：1.可以像上一题那样，最后返回 last
 *      2.也可以每次都对前一个数组做操作
 */
func getRow(_ rowIndex: Int) -> [Int] {
    guard rowIndex > 0 else {
        return [1]
    }
    
    var n = 1
    var temp = [1,1]
    while n < rowIndex {
        var arr = [1]
        for i in 1..<temp.count{
            arr.append(temp[i] + temp[i - 1])
        }
        arr.append(temp.last!)
        temp = arr
        n += 1
    }
    
    return temp
}

/**
 * 题目：给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j 的差的绝对值最大为 k。
 * 分析：1.这道题有问题   leetcode 给参数 nums = [9,9], k=2 居然要求结果是 true， 无语
 */
func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    guard nums.count > 1 , nums.count > k else {
        return false
    }
    var map = [Int : [Int]]()
    for i in 0..<nums.count {
        let n = nums[i]
        if map[n] == nil {
            map[n] = [i]
        }else {
            for j in map[n]! {
                if i - j == k {
                    return true
                }
            }
            map[n]!.append(i)
        }
    }
    return false
}

/**
 * 题目：给定一个非空数组，返回此数组中第三大的数。如果不存在，则返回数组中最大的数。要求算法时间复杂度必须是O(n)。
 * 分析：1.
 */
func thirdMax(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var temp = [nums[0]]
    for i in 1..<nums.count {
        let n = nums[i]
        if temp.contains(n) {
            continue
        }
        if temp.count == 3 {
            // 已经存在3个值
            if n > temp[0] {
                temp.insert(n, at: 0)
                temp.removeLast()
            }else if n > temp[1] {
                temp.insert(n, at: 1)
                temp.removeLast()
            }else if n > temp[2] {
                temp.insert(n, at: 2)
                temp.removeLast()
            }
        }else if temp.count == 2{
            // 已经存在2个值
            if n > temp[0] {
                temp.insert(n, at: 0)
            }else if n > temp[1] {
                temp.insert(n, at: 1)
            }else {
                temp.append(n)
            }
        }else {
            // 已经存在1个值
            if n > temp[0] {
                temp.insert(n, at: 0)
            }else{
                temp.append(n)
            }
        }
    }
    
    return temp.count == 3 ? temp.last! : temp.first!
}



/**
 * 题目：给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。找到所有在 [1, n] 范围之间没有出现在数组中的数字。
 * 分析：1.用一个 count = n 的数组处理
 */
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var temp = [Int]()
    for _ in 0..<nums.count {
        temp.append(0)
    }
    for n in nums {
        temp[n - 1] = 1
    }
    var res = [Int]()
    for i in 0..<temp.count {
        if temp[i] == 0 {
            res.append(i + 1)
        }
    }
    return res
}


/**
 * 题目：给定一个二进制数组， 计算其中最大连续1的个数。
 * 分析：1.
 */
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var maxl = 0
    var l = 0
    for i in 0..<nums.count {
        if nums[i] == 0 {
            maxl = max(maxl,l)
            l = 0
        }else{
            l += 1
        }
    }
    return max(maxl,l)
}

/**
 * 题目：给定一个整数数组和一个整数 k, 你需要在数组里找到不同的 k-diff 数对。这里将 k-diff 数对定义为一个整数对 (i, j), 其中 i 和 j 都是数组中的数字，且两数之差的绝对值是 k.
 * 说明：[1, 2, 3, 4, 5], k = 1 输出: 4  解释: 数组中有四个 1-diff 数对, (1, 2), (2, 3), (3, 4) 和 (4, 5)。
 * 分析：1.用一个 count = n 的数组处理
 */
func findPairs(_ nums: [Int], _ k: Int) -> Int {
    guard k >= 0 else {
        return 0
    }
    var map = [Int : Int]()
    var res = 0
    for i in 0..<nums.count {
        let n = nums[i]
        if map[n] == nil {
            map[n] = 1
            map[n + k] = 0
            map[n - k] = 0
        }else if map[n] == 0{
            map[n] = 1
            if map[n + k] == 1 {
                res += 1
            }else {
                map[n + k] = 0
            }
            if map[n - k] == 1 {
               res += 1
            }else {
                map[n - k] = 0
            }
            if k == 0 {
                res -= 1
            }
        }
    }
    return res
}


/**
 * 题目：给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 * 说明：输入："23" 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 * 分析：1.好像只能全部遍历？
 */
func letterCombinations(_ digits: String) -> [String] {
    guard digits.count > 0 else {
        return []
    }
    let map : [Character : [String]] = ["2" : ["a","b","c"],
                                        "3" : ["d","e","f"],
                                        "4" : ["g","h","i"],
                                        "5" : ["j","k","l"],
                                        "6" : ["m","n","o"],
                                        "7" : ["p","q","r","s"],
                                        "8" : ["t","u","v"],
                                        "9" : ["w","x","y","z"],]
    var temp = [String]()
    for c in digits {
        let array = map[c]!
        var newTemp = [String]()
        for t in temp {
            var new = ""
            for x in array {
                new = t + x
                newTemp.append(new)
            }
        }
        temp = newTemp
        if temp.count == 0 {
            temp = map[digits.first!]!
        }
    }
    return temp
}


/**
 * 题目：给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。你的算法时间复杂度必须是 O(log n) 级别。如果数组中不存在目标值，返回 [-1, -1]。
 * 分析：1.排序好的数组找值，一般都用二分法，不然很有可能超时
 *      2.注意是否存在目标值
 */
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 0 else {
        return [-1,-1]
    }
    guard target >= nums.first!, target <= nums.last! else {
        return [-1,-1]
    }
    
    var a = 0
    var b = nums.count
    while a < b {
        let c = (a + b) / 2
        if nums[c] < target {
            a = c + 1
        }else {
            b = c
        }
    }
    if nums[a] != target {
        return [-1,-1]
    }
    
    var x = 0
    var y = nums.count
    while x < y {
        let c = (x + y) / 2
        if nums[c] <= target {
            x = c + 1
        }else {
            y = c
        }
    }
    
    return [a, x - 1]
}



/**
 * 题目：给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 * 分析：例如，给出 n = 3，生成结果为：
 * [
 * "((()))",
 * "(()())",
 * "(())()",
 * "()(())",
 * "()()()"
 * ]
 */
func generateParenthesis(_ n: Int) -> [String] {
    guard n > 0 else {
        return []
    }
    guard n > 1 else {
        return ["()"]
    }
    // 目前还没好的思路
    
    return []
}



/**
 * 题目：给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。
 * 分析：1.先遍历拿到所有为0的点的坐标，再统一处理应该可行
 */
func setZeroes(_ matrix: inout [[Int]]) {
    guard matrix.count > 0 else {
        return
    }
    var zeroArray = [(Int,Int)]()
    for i in 0..<matrix.count {
        let arr = matrix[i]
        for j in 0..<arr.count {
            if matrix[i][j] == 0 {
                zeroArray.append((i,j))
            }
        }
    }
    var xSet = Set<Int>()
    var ySet = Set<Int>()
    for (x,y) in zeroArray {
        xSet.insert(x)
        ySet.insert(y)
    }
    for x in xSet {
        for i in 0..<matrix[x].count{
            matrix[x][i] = 0
        }
    }
    for y in ySet {
        for i in 0..<matrix.count{
            matrix[i][y] = 0
        }
    }
}

/**
 * 题目：给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 * 说明：所有输入均为小写字母。 不考虑答案输出的顺序。
 * 分析：1.一看到限制输入为小写字母就直接想到 用一个长度为26的数组
 *      2.第二种方法比较巧妙，直接将字符串排序再比对
 */
func groupAnagrams(_ strs: [String]) -> [[String]] {
    guard strs.count > 0 else {
        return []
    }
    guard strs.count > 1 else {
        return [strs]
    }
    let origin = Array.init(repeating: 0, count: 26)
    var map = [String : [String]]()
    for s in strs {
        var arr = origin
        for c in s.utf8 {
            let index = Int(c - 97)
            arr[index] += 1
        }
        var t : String = ""
        for c in arr {
            t.append(String(c))
        }
        if map.keys.contains(t){
            map[t]?.append(s)
        }else{
            map[t] = [s]
        }
    }
    return [[String]](map.values)
}

/**
 * 题目：给定一个未排序的数组，请判断这个数组中是否存在长度为3的递增的子序列。
 * 说明：如果存在这样的 i, j, k,  且满足 0 ≤ i < j < k ≤ n-1，使得 arr[i] < arr[j] < arr[k] ，返回 true ; 否则返回 false 。
 * 分析：1.一开始想用长度为3的框去套，框内的数组排序后还跟原数组相同就是递增，后来发现题目的意思并不是连续的值。
 *      2.
 */
func increasingTriplet(_ nums: [Int]) -> Bool {
    guard nums.count > 3 else {
        return false
    }
    var compareArr = Array.init(repeating: false, count: nums.count)
    var minValue = nums[0]
    var temp = [Int]()
    for i in 1..<nums.count {
        let n = nums[i]
        if n > minValue {
            compareArr[i] = true
            temp.append(n)
        }else{
            minValue = n
        }
    }
    
    if temp.count < 1 {
        return false
    }
    
    var c = Array.init(repeating: false, count: temp.count)
    var m = temp[0]
    for i in 1..<temp.count {
        let n = temp[i]
        if n > m {
            c[i] = true
        }else{
            m = n
        }
    }
    
    for i in c {
        if i == true {
            return true
        }
    }
    
    return false
}



/**
 * 题目：给定一个没有重复数字的序列，返回其所有可能的全排列。
 * 分析：1.
 */
func permute(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 1 else {
        return [nums]
    }
    var result = [[Int]]()
    for n in nums {
        result.append([n])
    }
    let numsSet = Set(nums)
    for _ in 0..<nums.count - 1 {
        var newResult = [[Int]]()
        for i in 0..<result.count {
            let array = result[i]
            let s = Set(array)
            let t = numsSet.subtracting(s)
            for n in t {
                var temp = array
                temp.append(n)
                newResult.append(temp)
            }
        }
        result = newResult
    }
    return result
}


/**
 * 题目：给定一个非空的整数数组，返回其中出现频率前 k 高的元素。
 * 分析：1.
 */
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.count > k else {
        return []
    }
    var map = [Int : Int]()
    for n in nums {
        map[n] = (map[n] ?? 0) + 1
    }
    let vsort = map.keys.sorted { (a, b) -> Bool in
        map[a]! > map[b]!
    }
    return Array(vsort[0..<k])
}


func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    guard nums.count > 1 else {
        return 1
    }
    let sortNums = nums.sorted()
    var result = 0
    var temp = 1
    for i in 1..<sortNums.count {
        if sortNums[i] - sortNums[i - 1] == 1 {
            temp += 1
        }else if sortNums[i] - sortNums[i - 1] > 1{
            result = max(temp,result)
            temp = 1
        }
    }
    return max(temp,result)
}


/**
 * 题目：在一个给定的数组nums中，总是存在一个最大元素 。查找数组中的最大元素是否至少是数组中每个其他数字的两倍。如果是，则返回最大元素的索引，否则返回-1。
 * 分析：1.
 */
func dominantIndex(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    var temp = [Int]()
    var max = 0
    var result = -1
    for i in 0..<nums.count {
        let n = nums[i]
        if n > max {
            max = n
            result = i
        }
        temp.append(n * 2)
    }
    
    for n in temp {
        if max < n && max * 2 != n{
            return -1
        }
    }
    
    return result
}

/**
 * 题目：给定一个整数类型的数组 nums，请编写一个能够返回数组“中心索引”的方法。我们是这样定义数组中心索引的：数组中心索引的左侧所有元素相加的和等于右侧所有元素相加的和。
 * 分析：1.
 */
func pivotIndex(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    var sum = 0
    for n in nums {
        sum += n
    }
    var leftSum = 0
    var rightSum = sum
    for i in 0..<nums.count {
        let n = nums[i]
        if leftSum == rightSum - n {
            return i
        }else{
            rightSum -= n
            leftSum += n
        }
    }
    return -1
}

/**
 * 题目：给定一个含有 M x N 个元素的矩阵（M行，N列），请以对角线遍历的顺序返回这个矩阵中的所有元素
 * 分析：1.
 */
func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.count > 0 else {
        return []
    }
    let m = matrix.count - 1
    let n = matrix[0].count - 1
    var result = [Int]()
    for i in 0...(m + n) {
        var x = 0
        var y = i - x
        var temp = [Int]()
        while true {
            if (x <= m && x >= 0) && (y <= n && y >= 0) {
                temp.append(matrix[x][y])
            }
            x += 1
            y -= 1
            if x > i{
                break
            }
        }
        temp = i % 2 == 1 ? temp : temp.reversed()
        result += temp
    }
    return result
}

/**
 * 题目：给定两个大小相等的数组 A 和 B，A 相对于 B 的优势可以用满足 A[i] > B[i] 的索引 i 的数目来描述。返回 A 的任意排列，使其相对于 B 的优势最大化。
 * 分析：1.
 */
func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
    var result = [Int]()
    var tempA = A
    for x in B {
        var t = -1
        var index = -1
        for i in 0..<tempA.count {
            let y = tempA[i]
            if y > x {
                if t == -1 {
                    t = y
                    index = i
                }else{
                    if t > y {
                        t = y
                        index = i
                    }
                }
            }
        }
        if index != -1 {
            tempA.remove(at: index)
        }
        result.append(t)
    }
    
    for i in 0..<result.count {
        let n = result[i]
        if n == -1 {
            result.replaceSubrange(Range(i...i), with: [tempA[0]])
            tempA.removeFirst()
        }
    }
    
    return result
}




func name() -> Void {
    let a1 = ["天","书","安"]
    let a2 = ["哲","博","瑜","恒","承","泽","宏","晨"]
    let a3 = ["宇","远"]
    let a4 = ["俊","弈","翰","靖","浩","彦"]

    let x = [(a1,a2),(a1,a3),(a1,a4),(a3,a1),(a3,a2),(a2,a1),(a4,a2),(a4,a3)]
    
    for (x1,x2) in x {
        for c1 in x1 {
            for c2 in x2 {
                print("王" + c1 + c2);
            }
        }
    }

}

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    guard nums1.count > 0 && nums2.count > 0 else {
        return []
    }
    var map = [Int: Int]()
    var result = Set<Int>()
    for m in nums1 {
        map[m] = 1
    }
    for n in nums2 {
        if map[n] != nil {
            result.insert(n)
        }
    }
    return Array(result)
}

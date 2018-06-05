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
 * 题目：给定一个 32 位有符号整数，将整数中的数字进行反转。
 * 分析：1.先计算出有几位
 *      2.再遍历取余
 *      3.是否可以先转字符串再转回 int
 */
func reverse1(_ x: Int) -> Int {
    guard x < -9 || x > 9 else {
        return x
    }
    var temp = x
    var result : Int = 0
    while temp != 0 {
        result = result * 10 + temp % 10
        temp = temp / 10
    }
    return result > INT32_MAX || result < -INT32_MAX ? 0 : result
}

func reverse2(_ x: Int) -> Int {
    guard x < -9 || x > 9 else {
        return x
    }
    var temp = x
    if x < 0 {
        temp = abs(temp)
    }
    var s = String(temp)
    s = reverseString2(s)
    if x < 0 {
        s = "-" + s
    }
    let result = Int(s)!
    return result > INT32_MAX || result < -INT32_MAX ? 0 : result
}

/**
 * 题目：给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。注意事项：您可以假定该字符串只包含小写字母。
 * 分析：1.看清题目，只包含小写字母
 *      2.如果字符串没有限制该怎么办
 *      3.这里我用 swift 都超时了，同样的方式用 c 和 js 都不会超时，猜测是 swift Character 转 ascii 耗时太厉害了
 */
func firstUniqChar1(_ s: String) -> Int {
    guard s.count > 0 else {
        return -1
    }
    var map : [Character : Int] = [Character : Int]()
    for c in s {
        if map[c] == nil {
            map[c] = 0
        }else{
            map[c] = map[c]! + 1
        }
    }
    for i in 0..<s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        if map[c]! == 0 {
            return i
        }
    }
    return -1
}

func firstUniqChar2(_ s: String) -> Int {
    guard s.count > 0 else {
        return -1
    }
    let a = Int("a".unicodeScalars.first!.value)
    let z = Int("z".unicodeScalars.first!.value)
    var array : [Int] = Array(repeatElement(0, count: z - a + 1))
    for c in s {
        let index = Int(c.unicodeScalars.first!.value)
        array[index - a] = array[index - a] + 1
    }
    for i in 0..<s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        let index = Int(c.unicodeScalars.first!.value)
        if array[index - a] == 1 {
            return i
        }
    }
    return -1
}

/**
 * 题目：给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。（包含的字母相同，位置不同，你可以假设字符串只包含小写字母。）
 * 分析：1.字符串包含的内容给限制的话，用数组最好，不给限制的话用 map
 *      2.
 */
func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    var mapS : [Character : Int] = [Character : Int]()
    for c in s {
        if mapS[c] == nil {
            mapS[c] = 0
        }else{
            mapS[c] = mapS[c]! + 1
        }
        
        // 这段可以写的更优雅,其他答案那里看来的，有点类似 oc 里面 x ?: y,都是简化版的三目运算
//        mapS[c] = (mapS[c] ?? 0) + 1
    }
    var mapT : [Character : Int] = [Character : Int]()
    for c in t {
        if mapT[c] == nil {
            mapT[c] = 0
        }else{
            mapT[c] = mapT[c]! + 1
        }
    }
    return mapS == mapT
}


/**
 * 题目：给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 * 分析：1.例子"abc cba" => true
 *      2.要考虑空格、字母大小写、数字
 */
func isPalindrome1(_ s: String) -> Bool {
    guard s.count > 0 else {
        return true
    }
    var temp = [Character]()
    for c in s {
        let asciiC = c.unicodeScalars.first!.value
        let isNumber = asciiC >= 48 && asciiC <= 57
        let isSmallLetter = asciiC >= 65 && asciiC <= 90
        let isBigLetter = asciiC >= 97 && asciiC <= 122
        if isNumber || isSmallLetter || isBigLetter {
            temp.append(c)
        }
    }
    let half : Int = temp.count / 2
    for i in 0..<half {
        // 首先判断两个字符是否相等
        // 再判断是否是因为大小写不相等
        // 由于是根据 ascii 码 + 32 去判断大小写，所以要先判断两个都不是数字
        // 其实可以在一开始就将字母都转成大写或者小写！！！
        let isEqual = temp[i] == temp[temp.count - i - 1]
        let asciiFirst = temp[i].unicodeScalars.first!.value
        let asciiSecond = temp[temp.count - i - 1].unicodeScalars.first!.value
        let isBothLetter = asciiFirst >= 65 && asciiSecond >= 65
        let isLetterEqual = asciiFirst + 32 == asciiSecond || asciiFirst == asciiSecond + 32
        if !isEqual {
            if isBothLetter {
                if !isLetterEqual {
                    return false
                }
            }else {
                return false
            }
        }
    }
    return true
}

func isPalindrome2(_ s: String) -> Bool {
    guard s.count > 0 else {
        return true
    }
    var temp = [Character]()
    for c in s {
        let asciiC = c.unicodeScalars.first!.value
        let isNumber = asciiC >= 48 && asciiC <= 57
        let isSmallLetter = asciiC >= 65 && asciiC <= 90
        let isBigLetter = asciiC >= 97 && asciiC <= 122
        if isNumber || isBigLetter {
            temp.append(c)
        }
        if isSmallLetter {
            temp.append(Character(UnicodeScalar(asciiC + 32)!))
        }
    }
    let half : Int = temp.count / 2
    for i in 0..<half {
        let isEqual = temp[i] == temp[temp.count - i - 1]
        if !isEqual {
            return false
        }
    }
    return true
}

/**
 * 题目：实现 atoi，将字符串转为整数。
 * 分析：1.遍历字符串，判断第一个字符，为空就跳过，不为数字或者+-返回0
 *      2.注意多次出现+-
 */
func myAtoi(_ str: String) -> Int {
    guard str.count > 0 else {
        return 0
    }
    var start = false
    var temp = [Character]()
    for c in str {
        let asciiC = c.unicodeScalars.first!.value
        let isNumber = asciiC >= 48 && asciiC <= 57
        let isSymbol = asciiC == 43 || asciiC == 45
        if start {
            if isNumber {
                temp.append(c)
            }else {
                break
            }
        }else{
            if c == " "{
                continue
            }else if isNumber {
                start = true
                temp.append(c)
            }else if isSymbol {
                start = true
                temp.append(c)
            }else {
                return 0
            }
        }
    }
    
    // 判断正负
    var neg = false
    if temp[0] == "+" {
        temp.removeFirst()
    }else if temp[0] == "-"{
        neg = true
        temp.removeFirst()
    }
    
    // 计算结果
    var result : Decimal = 0
    for i in 0..<temp.count {
        let asciiC = temp[i].unicodeScalars.first!.value
        result = result + Decimal(asciiC - 48) * pow(10, temp.count - i - 1)
    }
    
    // 返回值类型有点难处理..应该是完成这道题目了
//    if result > Decimal(INT_MAX) {
//        return neg ? -INT_MAX : INT_MAX
//    } else {
//        return neg ? -result : result
//    }
    return 0
}


/**
 * 题目：给定一个 haystack 字符串和一个 needle 字符串，找出 haystack 中 needle 第一次出现的位置
 * 分析：1.注意提前结束循环
 */
func strStr(_ haystack: String, _ needle: String) -> Int {
    guard needle != "" else {
        return 0
    }
    guard haystack.count >= needle.count else {
        return -1
    }
    for i in 0..<haystack.count - needle.count + 1 {
        let c = haystack[haystack.index(haystack.startIndex, offsetBy: i)]
        if c == needle.first! {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(startIndex, offsetBy: needle.count)
            let sub = haystack[startIndex..<endIndex]
            if sub == needle {
                return i
            }
        }
    }
    return -1
}


/**
 * 题目：报数序列是指一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。给定一个正整数 n ，输出报数序列的第 n 项。
 *      1    1个1 ↓
 *      11   2个1 ↓
 *      21   1个2 1个1 ↓
 *      1211 1个1 1个2 2个1
 * 分析：1.
 */
func countAndSay(_ n: Int) -> String {
    guard n >= 0 else {
        return ""
    }
    var temp : [String] = ["1"]
    for i in 1..<n {
        temp.append(getCountSreing(temp[i - 1]))
    }
    print(temp)
    return temp[n - 1]
}

func getCountSreing(_ str : String) -> String {
    guard str.count > 0 else {
        return ""
    }
    
    var temp : String = ""
    var count = 0
    var char = str.first
    
    for i in 0..<str.count {
        let c = str[str.index(str.startIndex, offsetBy: i)]
        if c == char {
            count = count + 1
        } else {
            temp = temp + String(count) + String(char!)
            count = 1
            char = c
        }
        if i == str.count - 1 {
            temp = temp + String(count) + String(char!)
        }
    }

    return temp
}



/**
 * 题目：编写一个函数来查找字符串数组中的最长公共前缀。如果不存在公共前缀，返回空字符串 ""。所有输入只包含小写字母 a-z 。
 * 分析：1.
 */
func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 0 else {
        return ""
    }
    guard strs.count > 1 else {
        return strs[0]
    }
    
    var minStr = strs[0]
    for s in strs {
        minStr = minStr.count < s.count ? minStr : s
    }
    
    var result = ""
    for i in 0..<minStr.count {
        let char = minStr[minStr.index(minStr.startIndex, offsetBy: i)]
        print("target char = " + String(char))
        for j in 0..<strs.count {
            let temp = strs[j][strs[j].index(strs[j].startIndex, offsetBy: i)]
            print("temp char = " + String(temp))
            if char == temp {
                if j == strs.count - 1 {
                    result = result + String(char)
                }
            }else{
                return result
            }
        }
    }
    
    return result
}


/**
 * 题目：给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。([)] false ,{[]} true
 * 分析：1.输入(,下一个只能是{、[、)中的一个，按这种思路来，一个个遍历肯定会超时
 *      2.考虑栈结构，左括号就压入，右括号就判断栈顶是否是对应的左括号
 *      3.注意最后栈需要为空，考虑只有左括号情况
 *
 */
func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else {
        return false
    }
    let map : [Character : Character] = ["(":")","[":"]","{":"}"]
    var stack = [Character]()
    for c in s {
        if c == "(" || c == "{" || c == "[" {
            stack.append(c)
        }else{
            if stack.last == nil || c != map[stack.last!]  {
                return false
            }else{
                stack.removeLast()
            }
        }
    }
    return true
}








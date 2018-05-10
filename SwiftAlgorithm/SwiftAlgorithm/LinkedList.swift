//
//  LinkedList.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/5/10.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation

/**
 * **************** *
 *   链表相关算法题。  *
 * **************** *
 */


// 链表节点
class ListNode {
    var value : Int
    var next : ListNode?
    init(value : Int) {
        self.value = value
        self.next = nil
    }
}
// 链表
class List {
    var head : ListNode?
    var tail : ListNode?
    // 链表尾部插入一个节点
    func appendToTail( node: Int) -> Void {
        if tail == nil {
            tail = ListNode(value: node)
            head = tail
        }else{
            tail!.next = ListNode(value: node)
            tail = tail!.next
        }
    }
    // 链表头部插入一个节点
    func appendToHead( node: Int) -> Void {
        if head == nil {
            head = ListNode(value: node)
            tail = head
        }else{
            let temp = ListNode(value: node)
            temp.next = head
            head! = temp
        }
    }
}

class LinkedList : NSObject {
    var nodeList : List?
    var headNode : ListNode?
    
    override init() {
        nodeList = List()
        headNode = ListNode(value: 1)
    }
    
    init(count : Int) {
        self.headNode = ListNode(value: 1)
        var temp = headNode
        for i in 2...count {
            let nextNode = ListNode(value: i)
            temp?.next = nextNode
            temp = nextNode
        }
        self.nodeList?.head = self.headNode
    }
}

/**
 * 题目：倒序输出链表
 * 分析：1.考虑递归
 *      2.考虑借助一个栈
 *      3.考虑先反转链表再输出(单独算一题)
 */
extension LinkedList {
    func reversePrintList1 (listHead : ListNode?) -> Void{
        if listHead != nil && listHead?.next != nil {
            reversePrintList1(listHead: listHead!.next)
        }
        print(listHead!.value)
    }
    
    func reversePrintList2 (listHead : ListNode?) -> Void{
        guard listHead != nil || listHead?.next != nil else {
            return
        }
        
        // 链表存入数组
        var arrayStack : [ListNode] = []
        var temp = listHead
        while temp!.next != nil {
            arrayStack.append(temp!)
            temp = temp?.next
        }
        arrayStack.append(temp!)
        
        // 每次输出 last object
        var array = arrayStack
        for _ in 0..<arrayStack.count {
            print(array.last!.value)
            array.removeLast()
        }
    }
}


/**
 * 题目：在O(1)时间删除单项链表节点
 * 分析：
 */
extension LinkedList {
    
    
    
}






















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
    
    // 实例化
    init(count : Int) {
        guard count > 0 else {
            return
        }
        self.head = ListNode(value: 1)
        var temp = head
        for i in 2...count {
            let nextNode = ListNode(value: i)
            temp?.next = nextNode
            temp = nextNode
        }
    }
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
    // 打印链表
    func printList() -> Void {
        var nodeStr = ""
        var temp = self.head
        while temp != nil {
            nodeStr.append(String(temp!.value) + "->")
            temp = temp?.next
        }
        print(nodeStr)
    }
}

/**
 * 题目：倒序输出链表
 * 分析：1.考虑递归
 *      2.考虑借助一个栈
 *      3.考虑先反转链表再输出(单独算一题)
 */
extension List {
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
 * 题目：在O(1)时间删除单项链表节点 例：a->b->c->d->e,删除 c
 * 分析：1.O(n)：遍历到 b，让 b 指向 d
 *      2.O(1)：直接让 c 的值等于 d，c 指向 e，把 d 删除
 *      3.考虑需要删除的节点是否是尾节点，尾节点只能遍历一遍
 *      4.考虑该链表是否只有一个节点
 */
extension List {
    func deleteNode(node: inout ListNode?) -> Void {
        guard self.head != nil || node != nil else {
            return
        }
        guard self.head!.next != nil else {
            self.head = nil
            return
        }
        
        if node!.next != nil {
            node!.value = node!.next!.value
            node!.next = node!.next!.next
        }else{
            var temp = self.head
            while temp?.next !== node {
                temp = temp?.next
            }
            temp?.next = nil
            node = nil
        }
    }
}


/**
 * 题目：输出单向链表中倒数第 K 个节点
 * 分析：1.先遍历得到链表的总节点数 N，再遍历到 N-k+1 输出
 *      2.指针1先遍历，遍历到k次后，指针2开始遍历，指针1到尾节点时，指针2刚好到倒数第 K 个节点
 */
extension List {
    
    
    
}



















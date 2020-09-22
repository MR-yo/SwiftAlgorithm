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
 * Line xx: 倒序输出链表
 * Line xx: O(1)时间删除节点
 * Line xx: 输出单向链表中倒数第 K 个节点
 * Line xx: 反转链表
 */


// 链表节点
class ListNode {
    var val : Int
    var next : ListNode?
    init(val : Int) {
        self.val = val
        self.next = nil
    }
}
// 链表
class List {
    var head : ListNode?
    var tail : ListNode?
    
    // 实例化
    init() {
        head = nil
        tail = nil
    }
    // 为了测试
    init(count : Int) {
        guard count > 0 else {
            return
        }
        head = ListNode(val: 0)
        var temp = head
        for i in 1...count {
            let nextNode = ListNode(val: i)
            temp!.next = nextNode
            temp = nextNode
            if i == count {
                tail = temp
            }
        }
    }
    
    // 链表尾部插入一个节点
    func appendToTail( node: ListNode) -> Void {
        if tail == nil {
            head = node
        }else{
            tail!.next = node
            tail = tail!.next
        }
    }
    // 链表头部插入一个节点
    func appendToHead( node: ListNode) -> Void {
        if head == nil {
            head = node
            tail = nil
        }else{
            node.next = head
            head! = node
        }
    }
    // 打印链表
    func printList(headNode: ListNode) -> Void {
        var nodeStr = ""
        var temp : ListNode? = headNode
        while temp != nil {
            nodeStr.append(String(temp!.val) + "->")
            temp = temp!.next
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
        print(listHead!.val)
    }
    
    func reversePrintList2 (listHead : ListNode?) -> Void{
        guard listHead != nil , listHead?.next != nil else {
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
            print(array.last!.val)
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
        guard self.head != nil , node != nil else {
            return
        }
        guard self.head!.next != nil else {
            self.head = nil
            return
        }
        
        if node!.next != nil {
            node!.val = node!.next!.val
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
    func logBackNode(targetNode:ListNode?, index: Int) -> Void {
        if index <= 0 || targetNode == nil {
            return
        }
        var temp1 = targetNode
        var temp2 = targetNode
        for _ in 0..<index {
            if temp1?.next != nil{
                temp1 = temp1?.next
            }else{
                temp1 = nil
                return
            }
        }
        while temp1?.next != nil {
            temp2 = temp2?.next
            temp1 = temp1!.next
        }
    }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard n > 0, head != nil else {
        return head
    }
    var count = 0
    var temp = head
    while temp != nil {
        count = count + 1
        temp = temp!.next
    }
    temp = head
    for _ in 0..<count - n {
        temp = temp!.next
    }
    if temp?.next == nil {
        temp = head
        for _ in 0..<count - n - 1 {
            temp = temp!.next
        }
        temp?.next = nil
        return head
    }
    temp!.val = temp!.next!.val
    temp!.next = temp?.next?.next
    return head
}


/**
 * 题目：反转链表
 * 分析：1.直接操作指针反转。注意要保留一个节点的前后节点，不然会断链
 *      2.新建一条链表，遍历压入节点
 */
extension List {
    func reverseList1(headNode : ListNode) -> Void {
        guard headNode.next != nil else {
            return
        }
        var temp : ListNode? = headNode
        var preNode : ListNode?
        while temp != nil {
            // 得到下一个节点
            let nextNode = temp!.next
            // 当前节点指向前一个节点
            temp?.next = preNode
            // 赋值前一个节点
            preNode = temp
            // 修改当前节点
            temp = nextNode
        }
        printList(headNode: preNode!)
    }
    
    func reverseList2(headNode : ListNode) -> Void {
        guard headNode.next != nil else {
            return
        }
        let newList = List()
        var temp : ListNode? = headNode
        while temp != nil {
            let node = ListNode(val: temp!.val)
            newList.appendToHead(node: node)
            temp = temp!.next
        }
        newList.printList(headNode: newList.head!)
    }
}


/**
 * 题目：合并两个排序的链表
 * 分析：1.逐个比较两个链表的第一个值，小的并入新链表，大的不变，再次比较
 *      2.注意空链表情况
 *      3.如果不能用一个新链表该怎么处理
 *      4.有相等的值有关系吗
 *      5.好像用递归会更好
 *      6.扩展一下，合并两个排序的数组，可能更简单一点
 */
func mergeTwoList(firstNode: ListNode?, secondNode: ListNode?) -> ListNode? {
    guard firstNode != nil else {
        return secondNode
    }
    guard secondNode != nil else {
        return firstNode
    }
    
    var temp1 = firstNode
    var temp2 = secondNode
    var nodeArray : [ListNode] = []
    
    while temp1 != nil && temp2 != nil {
        if temp1!.val < temp2!.val {
            nodeArray.append(ListNode(val: temp1!.val))
            temp1 = temp1!.next
        }else{
            nodeArray.append(ListNode(val: temp2!.val))
            temp2 = temp2!.next
        }
    }
    
    for i in 0..<nodeArray.count - 1 {
        let node = nodeArray[i]
        node.next = nodeArray[i + 1]
    }
    let lastNode = nodeArray.last
    lastNode?.next = temp1 == nil ? temp2 : temp1
    
    return nodeArray[0]
}


/**
 * 题目：请判断一个链表是否为回文链表。
 * 分析：1.
 */
func isPalindrome(_ head: ListNode?) -> Bool {
    if head == nil {
        return true
    }
    var arr = [Int]()
    var temp = head
    while temp != nil {
        arr.append(temp!.val)
        temp = temp!.next
    }
    
    // 1.循环判断
    let half = arr.count / 2
    for i in 0..<half {
        if arr[i] != arr[arr.count - i - 1] {
            return false
        }
    }
    return true
    
    // 2.调用系统 api
//    if arr == arr.reversed() {
//        return true
//    }else{
//        return false
//    }
}


/**
 * 题目：请判断一个链表内是否有环
 * 分析：1.你能否不使用额外空间解决此题？
 */
func isListHaveLoop(head : ListNode?) -> Bool {
    guard head != nil, head?.next == nil else {
        return false
    }
    var map = [Int : ListNode]()
    var temp = head
    while (temp != nil) {
        if (map[temp!.val] != nil){
            let preNode = map[temp!.val]
            let nowNode = temp
            let nextNode = temp!.next
            if (preNode === nowNode || preNode === nextNode || nowNode === nextNode){
                return true
            }
        }else {
            map[temp!.val] = temp;
        }
        temp = temp!.next;
    }
    return false;
}


/**
 * 题目：给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们的每个节点只存储单个数字。将两数相加返回一个新的链表。
 * 分析：1.自己的渣渣写法
 *      2.大神写法
 */
func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil else {
        return l2
    }
    guard l2 != nil else {
        return l1
    }

    var t1 = l1
    var t2 = l2
    var arr = [ListNode]()
    while t1 != nil && t2 != nil {
        arr.append(ListNode(val: t1!.val + t2!.val))
        t1 = t1!.next
        t2 = t2!.next
    }
    
    if t1 == nil {
        while t2 != nil{
            arr.append(ListNode(val:t2!.val))
            t2 = t2?.next
        }
    }else {
        while t1 != nil{
            arr.append(ListNode(val:t1!.val))
            t1 = t1?.next
        }
    }
    
    for i in 0..<arr.count - 1 {
        if arr[i].val >= 10 {
            arr[i].val = arr[i].val % 10
            arr[i + 1].val += 1
        }
    }
    if arr.last?.val == 10 {
        arr[arr.count - 1].val = 0
        arr.append(ListNode(val: 1))
    }
    
    for i in 0..<arr.count - 1{
        arr[i].next = arr[i + 1]
    }
    return arr[0]
}

func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let resultNode = ListNode(val: 0)
    var carryOver = 0
    var tempNode = resultNode
    
    var next1 = l1
    var next2 = l2
    
    while (next1 != nil) || (next2 != nil) || carryOver != 0 {
        
        let num = (next1 != nil ? next1!.val : 0) + (next2 != nil ? next2!.val : 0) + carryOver
        carryOver = num / 10
        let numNode = ListNode(val: num % 10)
        
        tempNode.next = numNode
        tempNode = numNode
        
        next1 = next1?.next
        next2 = next2?.next
    }
    
    return resultNode.next;
}

/**
 * 题目：给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 * 分析：1.
 */
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard let h = head  else {
        return head
    }
    var temp = h
    while temp.next != nil {
        if temp.val == temp.next!.val {
            temp.next = temp.next?.next
        }else{
            temp = temp.next!
        }
    }
    return h
}

/**
 * 题目：合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 * 说明：输入:[1->4->5,1->3->4,2->6] 输出: 1->1->2->3->4->4->5->6
 * 分析：1.没什么好的思路
 */
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else {
        return nil
    }
    guard lists.count > 1 else {
        return lists[0]
    }
    
    return nil
}


/**
 * 题目：给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。
 * 分析：1.
 */
func oddEvenList(_ head: ListNode?) -> ListNode? {
    guard head != nil, head?.next != nil else {
        return head
    }
    var odd = head
    var even = head!.next
    var temp = head
    var preNode = head
    var isOdd = true
    while temp != nil {
        if isOdd {
            odd?.next = temp
            preNode = temp
            isOdd = false
        }else {
            isOdd = true
        }
    }
    return head
}


